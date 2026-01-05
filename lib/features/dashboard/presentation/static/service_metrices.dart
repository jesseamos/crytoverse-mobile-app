import 'package:coinranking/core/icons/reward_icon.dart';
import 'package:coinranking/core/utils/utils.dart';
import 'package:coinranking/features/dashboard/data/models/coin_detail_response.dart';

class ServiesMetrices {
  final String icon;
  final String title;
  final String count;
  const ServiesMetrices({
    required this.icon,
    required this.title,
    required this.count,
  });
}

List<ServiesMetrices> mapRewardMetrices({required CoinDetail param}) {
  return [
    ServiesMetrices(
      icon: totalEarningIcon,
      title: 'Price to USD',
      count: '\$${formatCompactNumber(param.price)}',
    ),
    ServiesMetrices(
      icon: currentMrrIcon,
      title: 'Rank',
      count: formatCompactNumber(param.rank),
    ),
    ServiesMetrices(
      icon: signupIcon,
      title: 'Market Cap',
      count: formatCompactNumber(param.marketCap),
    ),
    ServiesMetrices(
      icon: linkClickedIcon,
      title: 'All-time-high(daily avg.',
      count: formatCompactNumber(param.allTimeHigh.price),
    ),
  ];
}
