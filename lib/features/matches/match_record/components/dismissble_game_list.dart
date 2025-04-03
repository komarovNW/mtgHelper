import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/extension/localization_extension.dart';

class DismissibleGamesList extends StatelessWidget {
  const DismissibleGamesList({
    super.key,
    required this.games,
    required this.onRemove,
  });
  final List<Game> games;
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          child: Text(
            context.l10n.matchesResult,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: List<DismissibleCard>.generate(
            games.length,
            (int index) {
              return DismissibleCard(
                index: index,
                games: games,
                onRemove: onRemove,
              );
            },
          ),
        ),
      ],
    );
  }
}

class DismissibleCard extends StatelessWidget {
  const DismissibleCard({
    super.key,
    required this.index,
    required this.games,
    required this.onRemove,
  });
  final int index;
  final List<Game> games;
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    final ValueKey<int> gameKey = ValueKey<int>(index);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: Dismissible(
        key: gameKey,
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection direction) {
          onRemove(index);
        },
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(context.l10n.matchGame(index + 1)),
              DropdownButton<Game>(
                value: games[index],
                onChanged: (Game? value) {
                  if (value != null) {
                    games[index] = value;
                  }
                },
                items: Game.values.map((Game game) {
                  return DropdownMenuItem<Game>(
                    value: game,
                    child: Text(game.text),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
