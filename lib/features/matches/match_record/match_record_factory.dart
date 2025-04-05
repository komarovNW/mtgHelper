import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_cubit.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_page.dart';

class MatchRecordFactory {
  MatchRecordFactory();

  MatchRecordCubit createMatchRecordCubit() {
    return MatchRecordCubit();
  }

  BlocProvider<MatchRecordCubit> createMatchRecordPage() {
    return BlocProvider<MatchRecordCubit>(
      create: (_) => createMatchRecordCubit(),
      child: const MatchRecordPage(),
    );
  }
}
