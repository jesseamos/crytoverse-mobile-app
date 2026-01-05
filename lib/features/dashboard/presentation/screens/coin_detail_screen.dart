import 'package:coinranking/core/presentation/custom_appbar.dart';
import 'package:coinranking/core/utils/utils.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/bar_chart.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/reward_metrices_grid.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/stats_carousel.dart';
import 'package:flutter/material.dart';

class CoinDetailScreen extends StatelessWidget {
  static const routeName = '/coin-detail-screen';
  final String coinId;
  const CoinDetailScreen({super.key, required this.coinId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bitcoin', style: Theme.of(context).textTheme.headlineLarge),
            Text(
              'What is BitcoinBitcoin is the first decentralized digital currency, created in 2009. It has a fixed limit of 21 million coins and works without banks or governments. Often called digital gold.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 16),
            RewardMetricesGrid(param: []),
            StatsCarousel(
              summaryCards: [
                {
                  "name": "Total cryptocurrencies",
                  "count": formatCompactNumber(100),
                },
                {"name": "Total Exchanges", "count": formatCompactNumber(100)},
                {"name": "Total Market Cap", "count": formatCompactNumber(100)},
                {"name": "Total 24h Volume", "count": formatCompactNumber(100)},
                {"name": "Total Markets", "count": formatCompactNumber(100)},
              ],
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
