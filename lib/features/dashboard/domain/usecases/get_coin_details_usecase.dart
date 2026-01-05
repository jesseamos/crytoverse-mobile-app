import 'package:coinranking/core/errors/failures.dart';
import 'package:coinranking/core/network/usecase.dart';
import 'package:coinranking/features/dashboard/data/models/coin_detail_response.dart';
import 'package:coinranking/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

class GetCoinDetailsUsecase implements UseCase<CoinDetailResponse, String> {
  final DashboardRepository dashboardRepository;
  const GetCoinDetailsUsecase(this.dashboardRepository);
  @override
  Future<Either<Failure, CoinDetailResponse>> call(String params) async {
    return await dashboardRepository.getCoinDetails(coinId: params);
  }
}
