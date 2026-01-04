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
