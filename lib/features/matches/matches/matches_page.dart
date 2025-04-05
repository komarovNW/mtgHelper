import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/matches/matches/components/match_card.dart';
import 'package:mtg_helper/features/matches/matches/matches_cubit.dart';
import 'package:mtg_helper/features/matches/matches/matches_state.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        needAddButton: true,
        title: context.l10n.drawerMatches,
      ),
      drawer: AppDrawer(
        currentPage: context.l10n.drawerMatches,
      ),
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
  @override
  void initState() {
    super.initState();
    // context.read<MatchesCubit>().initProcess();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MatchesCubit, MatchesState>(
      listener: (BuildContext context, MatchesState state) {},
      child: BlocBuilder<MatchesCubit, MatchesState>(
        builder: (BuildContext context, MatchesState state) {
          return state.map(
            success: (MatchesSuccess state) =>
                SearchSuccessBody(allMatches: state.allMatches),
            loading: (_) => const AppLoader(),
            failure: (MatchesFailure state) => AppError(error: state.error),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class SearchSuccessBody extends StatelessWidget {
  const SearchSuccessBody({super.key, required this.allMatches});
  final List<MatchModel> allMatches;

  @override
  Widget build(BuildContext context) {
    if (!allMatches.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          // itemCount: allMatches.length,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return MatchCard(
              match:
                  // allMatches[index]
                  MatchModel(
                playerDeck: 'allMatches[index].playerDeck',
                opponentDeck: 'allMatches[index].opponentDeck',
                date: DateTime.now(),
                isOnPlay: true,
                format: Format.pioneer,
                opponentName: 'allMatches[index].opponentName',
                games: <Game>[],
              ),
            );
          },
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            context.l10n.matchesEmpty,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
