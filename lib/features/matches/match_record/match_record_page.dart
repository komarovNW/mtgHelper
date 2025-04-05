import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/matches/match_record/components/add_new_game.dart';
import 'package:mtg_helper/features/matches/match_record/components/date_picker.dart';
import 'package:mtg_helper/features/matches/match_record/components/dismissble_game_list.dart';
import 'package:mtg_helper/features/matches/match_record/components/first_player_switch.dart';
import 'package:mtg_helper/features/matches/match_record/components/format_dropdown.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/widgets/app_button.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/widgets/text_form_fields/app_text_form_field.dart';

class MatchRecordPage extends StatefulWidget {
  const MatchRecordPage({super.key});

  @override
  State<MatchRecordPage> createState() => _MatchRecordPageState();
}

class _MatchRecordPageState extends State<MatchRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDrawerButton: false,
        title: TitleWidget(
          title: context.l10n.match,
        ),
      ),
      drawer: const AppDrawer(),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final TextEditingController _playerDeckController = TextEditingController();
  final TextEditingController _opponentDeckController = TextEditingController();
  final TextEditingController _opponentNameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _isOnPlay = true;
  Format _selectedFormat = Format.pioneer;
  final List<Game> _games = <Game>[Game.win, Game.win];

  void _addGame() => setState(() => _games.add(Game.win));

  void _removeGame(int index) => setState(() => _games.removeAt(index));

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: AppTextFormField(
                text: context.l10n.matchDeckName,
                controller: _playerDeckController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 2,
              ),
              child: AppTextFormField(
                text: context.l10n.matchDeckNameOpponent,
                controller: _opponentDeckController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: AppTextFormField(
                text: context.l10n.matchNameOpponent,
                controller: _opponentNameController,
              ),
            ),
            DatePicker(
              selectedDate: _selectedDate,
              onTap: () => _selectDate(context),
            ),
            PlayFirstSwitch(
              isOnPlay: _isOnPlay,
              onChanged: (bool value) => setState(() => _isOnPlay = value),
            ),
            const HBox(8),
            FormatDropdown(
              selectedFormat: _selectedFormat,
              onFormatSelected: (Format format) {
                setState(() => _selectedFormat = format);
              },
            ),
            const HBox(8),
            DismissibleGamesList(
              games: _games,
              onRemove: _removeGame,
            ),
            const HBox(8),
            AddNewGameButton(
              onTap: _addGame,
            ),
            const HBox(16),
            Padding(
              padding: const EdgeInsets.all(8),
              child: AppButton(
                text: context.l10n.save,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
