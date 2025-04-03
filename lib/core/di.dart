import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/features/auctions/auctions_factory.dart';
import 'package:mtg_helper/features/auth/auth_factory.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_factory.dart';
import 'package:mtg_helper/features/matches/matches/matches_factory.dart';
import 'package:mtg_helper/features/price/price_factory.dart';
import 'package:mtg_helper/features/profile/profile_factory.dart';
import 'package:mtg_helper/features/registration/registration_factory.dart';
import 'package:mtg_helper/features/score/score_factory.dart';
import 'package:mtg_helper/features/search/search_factory.dart';

class DependencyInjectionContainer {
  static late final Dio _dio;
  static late final DioService _dioService;
  static late AuthFactory authFactory;
  static late RegistrationFactory registrationFactory;
  static late ScoreFactory scoreFactory;
  static late AuctionsFactory auctionsFactory;
  static late SearchFactory searchFactory;
  static late PriceFactory priceFactory;
  static late ProfileFactory profileFactory;
  static late MatchesFactory matchesFactory;
  static late MatchRecordFactory matchRecordFactory;
  static void init() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    _dio = Dio();
    _dioService = DioService(_dio);
    auctionsFactory = AuctionsFactory(dioService: _dioService);
    authFactory = AuthFactory(firebaseAuth: firebaseAuth);
    registrationFactory = RegistrationFactory(firebaseAuth: firebaseAuth);
    scoreFactory = ScoreFactory();
    searchFactory = SearchFactory(dioService: _dioService);
    priceFactory = PriceFactory(dioService: _dioService);
    profileFactory = ProfileFactory();
    matchesFactory = MatchesFactory(dioService: _dioService);
    matchRecordFactory = MatchRecordFactory();
  }
}
