import 'package:coinranking/core/presentation/custom_appbar.dart';
import 'package:coinranking/core/utils/utils.dart';
import 'package:coinranking/features/dashboard/data/models/coin_detail_response.dart';
import 'package:coinranking/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:coinranking/features/dashboard/presentation/screens/home_screen.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/bar_chart.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/reward_metrices_grid.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/stats_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinDetailScreen extends StatefulWidget {
  static const routeName = '/coin-detail-screen';
  final String coinId;
  const CoinDetailScreen({super.key, required this.coinId});

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardCubit>().getCoinDetail(coinId: widget.coinId);
      context.read<DashboardCubit>().getCoinHistory(coinId: widget.coinId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<DashboardCubit, DashboardState>(
              buildWhen: (prev, curr) =>
                  curr is GetCoinDetailLoading || curr is GetCoinDetailSuccess,
              builder: (context, state) {
                if (state is GetCoinsFailure) {
                  return Center(child: Text(state.message));
                }
                if (state is GetCoinDetailSuccess) {
                  final CoinDetail coin = state.data.data.coin;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          currencyIcon(coin.iconUrl),
                          SizedBox(width: 10),
                          Text(
                            coin.name,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        coin.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 16),
                      RewardMetricesGrid(param: coin),
                      StatsCarousel(
                        summaryCards: [
                          {
                            "name": "Number Of Markets",
                            "count": formatCompactNumber(coin.numberOfMarkets),
                          },
                          {
                            "name": "Number Of Exchanges",
                            "count": formatCompactNumber(
                              coin.numberOfExchanges,
                            ),
                          },
                          {
                            "name": "Total Supply",
                            "count": formatCompactNumber(coin.supply.total),
                          },
                          {
                            "name": "Circulating Supply",
                            "count": formatCompactNumber(
                              coin.supply.circulating,
                            ),
                          },
                        ],
                      ),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),

            SizedBox(height: 16),
            BarChart(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
