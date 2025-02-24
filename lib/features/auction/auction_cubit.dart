import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/auction/auction_mock.dart';
import 'package:mtg_helper/features/auction/auction_state.dart';

class AuctionCubit extends Cubit<AuctionState> {
  AuctionCubit() : super(const AuctionState.loading());

  static const int _pageSize = 10;

  List<Map<String, dynamic>> _listOfAuctions = <Map<String, dynamic>>[];

  String filterText = '';

  Future<void> initProcess() async {
    emit(const AuctionState.loading());
    filterText = '';
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    _listOfAuctions =
        List<Map<String, dynamic>>.from(AuctionMock.list).take(10).toList();
    emit(
      AuctionState.success(
        allAuctions: _listOfAuctions,
        hasMore: AuctionMock.list.length > _pageSize,
      ),
    );
  }

  Future<void> reset() async {
    emit(const AuctionState.loading());
    filterText = '';
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    _listOfAuctions =
        List<Map<String, dynamic>>.from(AuctionMock.list).take(10).toList();
    emit(
      AuctionState.success(
        allAuctions: _listOfAuctions,
        hasMore: AuctionMock.list.length > _pageSize,
      ),
    );
  }

  Future<void> loadMore() async {
    if (filterText.isEmpty) {
      final int currentLength = _listOfAuctions.length;
      final int remaining = AuctionMock.list.length - currentLength;
      if (remaining > 0) {
        final List<Map<String, dynamic>> nextBatch =
            AuctionMock.list.skip(currentLength).take(_pageSize).toList();
        _listOfAuctions.addAll(nextBatch);
        emit(
          AuctionState.success(
            allAuctions: AuctionMock.list,
            hasMore: _listOfAuctions.length < AuctionMock.list.length,
          ),
        );
      }
    }
  }

  void filter(String query) {
    filterText = query;
    final List<Map<String, dynamic>> filtered = AuctionMock.list
        .where(
          (Map<String, dynamic> lot) =>
              lot['lot'].toString().toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    emit(
      AuctionState.success(
        allAuctions: filtered,
        hasMore: false,
      ),
    );
  }
}
