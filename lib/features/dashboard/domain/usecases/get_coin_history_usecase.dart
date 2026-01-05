import 'package:coinranking/core/errors/failures.dart';
import 'package:coinranking/core/network/usecase.dart';
import 'package:coinranking/features/dashboard/data/models/coin_history_response.dart';
import 'package:coinranking/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

class GetCoinHistoryUsecase implements UseCase<CoinHistoryResponse, String> {
  final DashboardRepository dashboardRepository;
  const GetCoinHistoryUsecase(this.dashboardRepository);
  @override
  Future<Either<Failure, CoinHistoryResponse>> call(String params) async {
    return await dashboardRepository.getCoinHistory(coinId: params);
  }
}
