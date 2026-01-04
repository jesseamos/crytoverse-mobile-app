import 'package:coinranking/core/errors/failures.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:dartz/dartz.dart';

abstract class DashboardRepository {
  Future<Either<Failure, CryptoResponse>> getCoins({
    Map<String, dynamic>? qparams,
  });
}
