import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/utils/dollar_exchange_notifier.dart';
import 'package:mtg_helper/utils/euro_exchange_notifier.dart';
import 'package:provider/provider.dart';

class CustomRateSwitcher extends StatefulWidget {
  const CustomRateSwitcher({super.key});

  @override
  State<CustomRateSwitcher> createState() => _CustomRateSwitcherState();
}

class _CustomRateSwitcherState extends State<CustomRateSwitcher> {
  bool _useCustomDollarExchange = false;
  final ValueNotifier<int> _dollarExchange = ValueNotifier<int>(1);
  bool _useCustomEuroExchange = false;
  final ValueNotifier<int> _euroExchange = ValueNotifier<int>(1);

  final TextEditingController _dollarController = TextEditingController();
  final TextEditingController _euroController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExchange();
  }

  /// TODO исправить
  Future<void> _loadExchange() async {
    // Check if the widget is still mounted before using context
    if (!mounted) return;

    final Map<String, dynamic> data =
        await context.read<DollarExchangeNotifier>().getCurrentExchangeData();
    if (!mounted) return; // Check after async operation

    _dollarExchange.value = data['exchange'];
    _useCustomDollarExchange = data['useCustomExchange'];

    _euroExchange.value =
        await context.read<EuroExchangeNotifier>().getEuroExchange();
    if (!mounted) return; // Check after async operation

    _useCustomEuroExchange =
        await context.read<EuroExchangeNotifier>().getUseCustomExchange();
    if (!mounted) return; // Check after async operation

    _dollarController.text = _dollarExchange.value.toString();
    _euroController.text = _euroExchange.value.toString();

    if (mounted) {
      setState(() {}); // Safe to call setState only if still mounted
    }
  }

  Future<void> _setCustomDollarExchange(int rate) async {
    setState(() => _useCustomDollarExchange = rate != 1);
    await context
        .read<DollarExchangeNotifier>()
        .setUseCustomRate(_useCustomDollarExchange);
  }

  Future<void> _setDollar(int number) async {
    await context.read<DollarExchangeNotifier>().setDollarExchange(number);
  }

  Future<void> _setCustomEuroExchange(int rate) async {
    setState(() => _useCustomEuroExchange = rate != 1);
    await context
        .read<EuroExchangeNotifier>()
        .setUseCustomRate(_useCustomEuroExchange);
  }

  Future<void> _setEuro(int number) async {
    await context.read<EuroExchangeNotifier>().setEuroExchange(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Кастомный курс',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            _SwitcherBox(
              title: 'Доллар',
              isActive: _useCustomDollarExchange,
              onChangeSwitch: _setCustomDollarExchange,
              controller: _dollarController,
              onChangeNumber: _setDollar,
            ),
            const SizedBox(width: 16),
            _SwitcherBox(
              title: 'Евро',
              isActive: _useCustomEuroExchange,
              onChangeSwitch: _setCustomEuroExchange,
              controller: _euroController,
              onChangeNumber: _setEuro,
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _dollarExchange.dispose();
    _euroExchange.dispose();
    _dollarController.dispose();
    _euroController.dispose();
    super.dispose();
  }
}

class _SwitcherBox extends StatelessWidget {
  const _SwitcherBox({
    required this.title,
    required this.isActive,
    required this.onChangeSwitch,
    required this.onChangeNumber,
    required this.controller,
  });

  final String title;
  final bool isActive;
  final dynamic onChangeSwitch;
  final dynamic onChangeNumber;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Switch(
            value: isActive,
            onChanged: (bool value) {
              onChangeSwitch(value ? 0 : 1);
            },
          ),
          SizedBox(
            width: 50,
            child: TextField(
              controller: controller,
              maxLength: 3,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
              textAlign: TextAlign.center,
              enabled: isActive,
              onChanged: (String value) {
                onChangeNumber(int.tryParse(value) ?? 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
