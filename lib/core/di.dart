import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/features/auctions/auctions_factory.dart';
import 'package:mtg_helper/features/auth/auth_factory.dart';
import 'package:mtg_helper/features/price/price_factory.dart';
import 'package:mtg_helper/features/profile/profile_factory.dart';
import 'package:mtg_helper/features/registration/registration_factory.dart';
import 'package:mtg_helper/features/score/score_factory.dart';
import 'package:mtg_helper/features/search/search_factory.dart';

class DependencyInjectionContainer {
  static late final Dio _dio;
  static late AuthFactory authFactory;
  static late RegistrationFactory registrationFactory;
  static late ScoreFactory scoreFactory;
  static late AuctionsFactory auctionsFactory;
  static late SearchFactory searchFactory;
  static late PriceFactory priceFactory;
  static late ProfileFactory profileFactory;
  static void init() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    _dio = Dio();
    authFactory = AuthFactory(firebaseAuth: firebaseAuth);
    registrationFactory = RegistrationFactory(firebaseAuth: firebaseAuth);
    scoreFactory = ScoreFactory();
    auctionsFactory = AuctionsFactory(dio: _dio);
    searchFactory = SearchFactory(dio: _dio);
    priceFactory = PriceFactory(dio: _dio);
    profileFactory = ProfileFactory();
  }
}
