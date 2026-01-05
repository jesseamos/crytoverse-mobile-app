import 'package:coinranking/core/icons/reward_icon.dart';
import 'package:coinranking/features/dashboard/data/models/coin_detail_response.dart';
import 'package:coinranking/features/dashboard/presentation/static/service_metrices.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/services_metrices_card.dart';
import 'package:flutter/material.dart';

class RewardMetricesGrid extends StatefulWidget {
  final CoinDetail param;
  RewardMetricesGrid({super.key, required this.param});

  @override
  State<RewardMetricesGrid> createState() => _RewardMetricesGridState();
}

class _RewardMetricesGridState extends State<RewardMetricesGrid> {
  List<ServiesMetrices>? rewardMetrices;
  @override
  void initState() {
    rewardMetrices = mapRewardMetrices(param: widget.param);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 1200
        ? 4
        : screenWidth > 800
        ? 3
        : 2;
    double aspectRatio = screenWidth > 800 ? 3 / 2 : 3 / 1.8;

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (ctx, i) {
            var item = rewardMetrices![i];
            return ServicesMetricesCard(
              count: item.count,
              icon: totalEarningIcon,
              title: item.title,
            );
          },
          itemCount: rewardMetrices?.length,
        ),
      ],
    );
  }
}
