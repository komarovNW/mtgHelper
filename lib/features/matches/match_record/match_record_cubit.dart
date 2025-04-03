import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_state.dart';

class MatchRecordCubit extends Cubit<MatchRecordState> {
  MatchRecordCubit() : super(const MatchRecordState.initial());
}
