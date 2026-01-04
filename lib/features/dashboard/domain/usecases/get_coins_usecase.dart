import 'package:coinranking/core/errors/failures.dart';
import 'package:coinranking/core/network/usecase.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:coinranking/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

class GetCoinsUsecase implements UseCase<CryptoResponse, Map<String, dynamic>> {
  final DashboardRepository dashboardRepository;
  const GetCoinsUsecase(this.dashboardRepository);
  @override
  Future<Either<Failure, CryptoResponse>> call(
    Map<String, dynamic>? params,
  ) async {
    return await dashboardRepository.getCoins(qparams: params);
  }
}
