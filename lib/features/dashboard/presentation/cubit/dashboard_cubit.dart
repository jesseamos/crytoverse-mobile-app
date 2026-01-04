import 'package:bloc/bloc.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:coinranking/features/dashboard/domain/usecases/get_coins_usecase.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetCoinsUsecase getCoinsUsecase;
  DashboardCubit({required this.getCoinsUsecase}) : super(DashboardInitial());

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
}
