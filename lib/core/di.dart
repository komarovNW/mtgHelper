import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/features/auctions/auctions_factory.dart';
import 'package:mtg_helper/features/auth/auth_factory.dart';
import 'package:mtg_helper/features/price/price_factory.dart';
import 'package:mtg_helper/features/score/score_factory.dart';

class DependencyInjectionContainer {
  static late AuthFactory authFactory;
  static late ScoreFactory scoreFactory;
  static late AuctionsFactory auctionsFactory;
  static late PriceFactory priceFactory;
  static void init() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final Dio dio = Dio();
    authFactory = AuthFactory(firebaseAuth: firebaseAuth);
    scoreFactory = ScoreFactory();
    auctionsFactory = AuctionsFactory(dio: dio);
    priceFactory = PriceFactory(dio: dio);
  }
}
