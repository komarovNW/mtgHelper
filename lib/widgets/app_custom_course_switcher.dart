import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/dollar_exchange_change_notifier.dart';
import 'package:mtg_helper/utils/euro_exchange_change_notifier.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:provider/provider.dart';

class AppCustomCourseSwitcher extends StatefulWidget {
  const AppCustomCourseSwitcher({super.key});

  @override
  State<AppCustomCourseSwitcher> createState() =>
      _AppCustomCourseSwitcherState();
}

class _AppCustomCourseSwitcherState extends State<AppCustomCourseSwitcher> {
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
    if (!mounted) return;
    final Map<String, dynamic> data = await context
        .read<DollarExchangeChangeNotifier>()
        .getCurrentExchangeData();
    if (!mounted) return;
    _dollarExchange.value = data['exchange'];
    _useCustomDollarExchange = data['useCustomExchange'];
    _euroExchange.value =
        await context.read<EuroExchangeChangeNotifier>().getEuroExchange();
    if (!mounted) return;
    _useCustomEuroExchange =
        await context.read<EuroExchangeChangeNotifier>().getUseCustomExchange();
    if (!mounted) return;
    _dollarController.text = _dollarExchange.value.toString();
    _euroController.text = _euroExchange.value.toString();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _setCustomDollarExchange(int rate) async {
    setState(() => _useCustomDollarExchange = rate != 1);
    await context
        .read<DollarExchangeChangeNotifier>()
        .setUseCustomRate(_useCustomDollarExchange);
  }

  Future<void> _setDollar(int number) async {
    await context
        .read<DollarExchangeChangeNotifier>()
        .setDollarExchange(number);
  }

  Future<void> _setCustomEuroExchange(int rate) async {
    setState(() => _useCustomEuroExchange = rate != 1);
    await context
        .read<EuroExchangeChangeNotifier>()
        .setUseCustomRate(_useCustomEuroExchange);
  }

  Future<void> _setEuro(int number) async {
    await context.read<EuroExchangeChangeNotifier>().setEuroExchange(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          context.l10n.customCourse,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xff474647),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: <Widget>[
            _SwitcherBox(
              title: context.l10n.dollar,
              isActive: _useCustomDollarExchange,
              onChangeSwitch: _setCustomDollarExchange,
              controller: _dollarController,
              onChangeNumber: _setDollar,
            ),
            const HBox(16),
            _SwitcherBox(
              title: context.l10n.euro,
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
    return Row(
      children: <Widget>[
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
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
            textAlign: TextAlign.center,
            enabled: isActive,
            onChanged: (String value) {
              onChangeNumber(int.tryParse(value) ?? 0);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const Spacer(),
        Switch(
          value: isActive,
          activeColor: const Color(0xffF45D01),
          activeTrackColor: const Color(0xff474647),
          onChanged: (bool value) {
            onChangeSwitch(value ? 0 : 1);
          },
        ),
      ],
    );
  }
}
