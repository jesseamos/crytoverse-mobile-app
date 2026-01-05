import 'package:coinranking/core/icons/reward_icon.dart';

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

List<ServiesMetrices> mapRewardMetrices({required dynamic param}) {
  return [
    ServiesMetrices(
      icon: totalEarningIcon,
      title: 'Total Earnings',
      count: '\$100',
    ),
    ServiesMetrices(icon: currentMrrIcon, title: 'Current MRR', count: '\$100'),
    ServiesMetrices(icon: signupIcon, title: 'Sign Ups', count: '100'),
    ServiesMetrices(icon: linkClickedIcon, title: 'Link Clicks', count: '0'),
  ];
}
