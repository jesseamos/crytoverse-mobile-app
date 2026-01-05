import 'package:bloc/bloc.dart';
import 'package:coinranking/features/dashboard/data/models/coin_detail_response.dart';
import 'package:coinranking/features/dashboard/data/models/coin_history_response.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:coinranking/features/dashboard/domain/usecases/get_coin_details_usecase.dart';
import 'package:coinranking/features/dashboard/domain/usecases/get_coin_history_usecase.dart';
import 'package:coinranking/features/dashboard/domain/usecases/get_coins_usecase.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetCoinsUsecase getCoinsUsecase;
  final GetCoinDetailsUsecase getCoinDetailsUsecase;
  final GetCoinHistoryUsecase getCoinHistoryUsecase;
  DashboardCubit({
    required this.getCoinsUsecase,
    required this.getCoinDetailsUsecase,
    required this.getCoinHistoryUsecase,
  }) : super(DashboardInitial());

  Future<void> getCoins({
    refresh = false,
    Map<String, dynamic>? qparams,
  }) async {
    if (refresh == false && state is GetCoinsSuccess) {
      return;
    }
    emit(GetCoinsLoading());
    final response = await getCoinsUsecase.call(qparams);
    response.fold(
      (f) => emit(GetCoinsFailure(f.message)),
      (response) => emit(GetCoinsSuccess(response)),
    );
  }

  Future<void> getCoinDetail({required String coinId}) async {
    emit(GetCoinDetailLoading());
    final response = await getCoinDetailsUsecase.call(coinId);
    response.fold(
      (f) => emit(GetCoinDetailFailure(f.message)),
      (response) => emit(GetCoinDetailSuccess(response)),
    );
  }

  Future<void> getCoinHistory({required String coinId}) async {
    emit(GetCoinHistoryLoading());
    final response = await getCoinDetailsUsecase.call(coinId);
    response.fold(
      (f) => emit(GetCoinHistoryFailure(f.message)),
      (response) => emit(GetCoinDetailSuccess(response)),
    );
  }
}
