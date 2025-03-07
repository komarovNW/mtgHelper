import 'package:mtg_helper/domain/repositories/auctions/favorites_auctions_repository.dart';

class GetFavoritesIdsUseCase {
  GetFavoritesIdsUseCase({required this.repository});
  final FavoritesRepository repository;

  Future<List<String>> call() async {
    return repository.getFavoriteIds();
  }
}
