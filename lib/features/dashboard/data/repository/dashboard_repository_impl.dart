import 'package:coinranking/core/errors/exceptions.dart';
import 'package:coinranking/core/errors/failures.dart';
import 'package:coinranking/core/network/connection_checker.dart';
import 'package:coinranking/core/utils/constants.dart';
import 'package:coinranking/features/dashboard/data/datasources/dashboard_remote_datasources.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:coinranking/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final ConnectionChecker connectionChecker;
  final DashboardRemoteDatasources dashboardRemoteDatasources;
  const DashboardRepositoryImpl(
    this.connectionChecker,
    this.dashboardRemoteDatasources,
  );
  @override
  Future<Either<Failure, CryptoResponse>> getCoins({
    Map<String, dynamic>? qparams,
  }) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }
      final response = await dashboardRemoteDatasources.getCoins();

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
