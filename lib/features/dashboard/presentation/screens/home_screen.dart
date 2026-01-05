import 'package:coinranking/core/presentation/global_shimmer.dart';
import 'package:coinranking/core/utils/utils.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:coinranking/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:coinranking/features/dashboard/presentation/screens/coin_detail_screen.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/stats_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:go_router/go_router.dart';

// Data model for a cryptocurrency
class CryptoCurrency {
  final String name;
  final String symbol;
  final String icon; // Using IconData for simplicity

  const CryptoCurrency({
    required this.name,
    required this.symbol,
    required this.icon,
  });
}

// The main screen widget
class HomeScreen extends StatefulWidget {
  static const routeName = '/payment-currrency';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State to keep track of the selected currency index
  int? _selectedIndex;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardCubit>().getCoins();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 10,
        centerTitle: false,
        title: Text(
          'Crytoverse',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is GetCoinsFailure) {
            return Center(child: Text(state.message));
          }
          if (state is GetCoinsSuccess) {
            final List<Coin> coins = state.data.data.coins;
            final Stats stats = state.data.data.stats;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatsCarousel(
                    summaryCards: [
                      {
                        "name": "Total cryptocurrencies",
                        "count": formatCompactNumber(stats.totalCoins),
                      },
                      {
                        "name": "Total Exchanges",
                        "count": formatCompactNumber(stats.totalExchanges),
                      },
                      {
                        "name": "Total Market Cap",
                        "count": formatCompactNumber(stats.totalMarketCap),
                      },
                      {
                        "name": "Total 24h Volume",
                        "count": formatCompactNumber(stats.total24hVolume),
                      },
                      {
                        "name": "Total Markets",
                        "count": formatCompactNumber(stats.totalMarkets),
                      },
                    ],
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 21,
                            mainAxisSpacing: 21,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: coins.length,
                      itemBuilder: (context, index) {
                        final currency = coins[index];
                        final isSelected = _selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: CurrencyCard(
                            currency: currency,
                            isSelected: false,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  final Coin currency;
  final bool isSelected;

  const CurrencyCard({
    super.key,
    required this.currency,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(CoinDetailScreen.routeName, extra: currency.uuid);
      },
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorsConstant.transparentBlue2
                    : ColorsConstant.darkgrey,
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(
                  color: isSelected
                      ? ColorsConstant.blue
                      : ColorsConstant.primaryBlack,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Currency Icon
                  currencyIcon(currency.iconUrl),
                  // Currency Name
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              currency.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,

                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

Widget currencyIcon(String url) {
  if (url.toLowerCase().endsWith('.svg')) {
    return SvgPicture.network(
      url,
      height: 50,
      width: 50,
      fit: BoxFit.cover,
      placeholderBuilder: (_) => GlobalShimmer(
        child: Container(height: 50, width: 50, color: ColorsConstant.stroke),
      ),
    );
  }

  return Image.network(
    url,
    height: 50,
    width: 50,
    fit: BoxFit.cover,
    errorBuilder: (_, __, ___) => GlobalShimmer(
      child: Container(height: 50, width: 50, color: ColorsConstant.stroke),
    ),
  );
}
