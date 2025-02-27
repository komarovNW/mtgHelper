import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/domain/entities/auction.dart';
import 'package:mtg_helper/domain/use_cases/auction/filter_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_use_case.dart';
import 'package:mtg_helper/features/auctions/auctions_state.dart';

class AuctionsCubit extends Cubit<AuctionsState> {
  AuctionsCubit({
    required GetUseCase getUseCase,
    required FilterUseCase filterUseCase,
  })  : _getUseCase = getUseCase,
        _filterUseCase = filterUseCase,
        super(const AuctionsState.loading());
  final GetUseCase _getUseCase;
  final FilterUseCase _filterUseCase;

  List<Auction> _allAuctions = <Auction>[];

  Future<void> initProcess() async {
    emit(const AuctionsState.loading());
    _allAuctions = (await _getUseCase()).reversed.toList();
    emit(
      AuctionsState.success(
        allAuctions: _allAuctions,
      ),
    );
  }

  Future<void> reset() async {
    emit(const AuctionsState.loading());
    emit(
      AuctionsState.success(
        allAuctions: _allAuctions,
      ),
    );
  }

  void filter(String query) {
    final List<Auction> filtered = _filterUseCase(_allAuctions, query);

    emit(AuctionsState.success(allAuctions: List<Auction>.of(filtered)));
  }
}
