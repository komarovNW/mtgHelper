import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:collection/collection.dart';

class MatchCard extends StatefulWidget {
  const MatchCard({
    super.key,
    required this.match,
    required this.onRemove,
    required this.index,
  });
  final MatchModel match;
  final int index;
  final void Function(String) onRemove;

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        // widget.onRemove(widget.index);
        widget.onRemove(widget.match.id!);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: widget.match.backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MatchHeader(match: widget.match),
                  const SizedBox(height: 8),
                  MatchDetails(match: widget.match),
                  AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: MatchGamesList(match: widget.match),
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MatchHeader extends StatelessWidget {
  const MatchHeader({super.key, required this.match});
  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            match.playerDeck,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                match.winScore,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  context.l10n.matchesVS,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                match.lossScore,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            match.opponentDeck,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class MatchDetails extends StatelessWidget {
  const MatchDetails({super.key, required this.match});
  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateFormat('dd.MM.yyyy').format(match.date)} • ${match.format.name}',
      style: const TextStyle(color: Colors.white70, fontSize: 12),
    );
  }
}

class MatchGamesList extends StatelessWidget {
  const MatchGamesList({super.key, required this.match});
  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const Divider(color: Colors.white54),
        Text(
          context.l10n.matchesResult,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        ...match.games.mapIndexed(
          (int index, Game game) => GameResult(
            index: index + 1,
            game: game,
          ),
        ),
        const SizedBox(height: 8),
        if (match.opponentName != null)
          Text(
            context.l10n.matchesOpponent(match.opponentName!),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        const SizedBox(height: 4),
        Text(
          match.isOnPlay
              ? context.l10n.matchesOnPlay
              : context.l10n.matchesOnDraw,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        if (match.comment!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              '${context.l10n.matchComment}: ${match.comment!}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}

class GameResult extends StatelessWidget {
  const GameResult({
    super.key,
    required this.game,
    required this.index,
  });
  final Game game;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Игра ${index.toString()}:',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            game.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
