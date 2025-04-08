import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_router.dart';
import 'package:mtg_helper/features/matches/matches/components/match_card.dart';
import 'package:mtg_helper/features/matches/matches/matches_cubit.dart';
import 'package:mtg_helper/features/matches/matches/matches_router.dart';
import 'package:mtg_helper/features/matches/matches/matches_state.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  Future<void> _onPressed() async {
    final bool? result = await context.push<bool>(
      '${MatchesRoutes.matchesPath}/${MatchRecordRoutes.matchRecordPath}',
    );
    if (mounted && result == true) {
      await context.read<MatchesCubit>().initProcess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: TitleWidget(
          title: context.l10n.drawerMatches,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: _onPressed,
            ),
          ),
        ],
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
  late AuthChangeNotifier userInfo;

  @override
  void initState() {
    super.initState();
    context.read<MatchesCubit>().initProcess();
  }

  void _removeGame(String index) {
    setState(() {
      // _games.removeAt(index);
      context.read<MatchesCubit>().deleteMatch(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MatchesCubit, MatchesState>(
      listener: (BuildContext context, MatchesState state) {},
      child: BlocBuilder<MatchesCubit, MatchesState>(
        builder: (BuildContext context, MatchesState state) {
          return state.map(
            success: (MatchesSuccess state) => SearchSuccessBody(
              allMatches: state.allMatches,
              onRemove: _removeGame,
            ),
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
  const SearchSuccessBody({
    super.key,
    required this.allMatches,
    required this.onRemove,
  });
  final List<MatchModel> allMatches;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    if (allMatches.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: allMatches.length,
          itemBuilder: (BuildContext context, int index) {
            return MatchCard(
              match: allMatches[index],
              onRemove: onRemove,
              index: index,
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
