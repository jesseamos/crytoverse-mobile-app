part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

final class GetCoinsLoading extends DashboardState {}

final class GetCoinsFailure extends DashboardState {
  final String message;
  const GetCoinsFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class GetCoinsSuccess extends DashboardState {
  final CryptoResponse data;
  const GetCoinsSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class GetCoinDetailLoading extends DashboardState {}

final class GetCoinDetailFailure extends DashboardState {
  final String message;
  const GetCoinDetailFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class GetCoinDetailSuccess extends DashboardState {
  final CoinDetailResponse data;
  const GetCoinDetailSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class GetCoinHistoryLoading extends DashboardState {}

final class GetCoinHistoryFailure extends DashboardState {
  final String message;
  const GetCoinHistoryFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class GetCoinHistorySuccess extends DashboardState {
  final CoinHistoryResponse data;
  const GetCoinHistorySuccess(this.data);
  @override
  List<Object> get props => [data];
}
