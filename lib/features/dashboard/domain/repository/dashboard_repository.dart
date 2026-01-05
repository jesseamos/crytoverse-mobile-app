import 'package:coinranking/core/errors/failures.dart';
import 'package:coinranking/features/dashboard/data/models/coin_detail_response.dart';
import 'package:coinranking/features/dashboard/data/models/coin_history_response.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:dartz/dartz.dart';

abstract class DashboardRepository {
  Future<Either<Failure, CryptoResponse>> getCoins({
    Map<String, dynamic>? qparams,
  });
  Future<Either<Failure, CoinDetailResponse>> getCoinDetails({
    required String coinId,
  });
  Future<Either<Failure, CoinHistoryResponse>> getCoinHistory({
    required String coinId,
  });
}
