import 'package:coinranking/core/presentation/global_shimmer.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:coinranking/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:coinranking/features/dashboard/presentation/widgets/stats_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/presentation/custom_appbar_with_logo.dart';
import 'package:coinranking/core/presentation/custom_back_button.dart';
import 'package:coinranking/core/presentation/custom_button.dart';
import 'package:coinranking/core/presentation/custom_input_field.dart';

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

// List of available cryptocurrencies
const List<CryptoCurrency> currencies = [
  CryptoCurrency(
    name: 'Bitcoin',
    symbol: 'BTC',
    icon: 'assets/images/cryto_currencys/bit-coin.png',
  ),
  CryptoCurrency(
    name: 'Ethereum',
    symbol: 'ETH',
    icon: 'assets/images/cryto_currencys/e.png',
  ), // Placeholder
  CryptoCurrency(
    name: 'Tether',
    symbol: 'USDT',
    icon: 'assets/images/cryto_currencys/t.png',
  ),
  CryptoCurrency(
    name: 'Dogecoin',
    symbol: 'DOGE',
    icon: 'assets/images/cryto_currencys/dodge.png',
  ),
  CryptoCurrency(
    name: 'BNB',
    symbol: 'BNB',
    icon: 'assets/images/cryto_currencys/d.png',
  ),
  CryptoCurrency(
    name: 'Litecoin',
    symbol: 'LTC',
    icon: 'assets/images/cryto_currencys/l.png',
  ),
  CryptoCurrency(
    name: 'Ripple',
    symbol: 'XRP',
    icon: 'assets/images/cryto_currencys/r.png',
  ),
  CryptoCurrency(
    name: 'Dash',
    symbol: 'DASH',
    icon: 'assets/images/cryto_currencys/da.png',
  ),
  CryptoCurrency(
    name: 'Bytecoin',
    symbol: 'BCN',
    icon: 'assets/images/cryto_currencys/b.png',
  ),
];

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
                        "count": stats.totalCoins,
                      },
                      {
                        "name": "Total Exchanges",
                        "count": stats.totalExchanges,
                      },
                      {
                        "name": "Total Market Cap",
                        "count": stats.totalMarketCap,
                      },
                      {
                        "name": "Total 24h Volume",
                        "count": stats.total24hVolume,
                      },
                      {"name": "Total Markets", "count": stats.totalMarkets},
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
    return SizedBox(
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
