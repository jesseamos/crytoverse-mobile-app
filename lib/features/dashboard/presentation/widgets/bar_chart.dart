import 'package:coinranking/core/presentation/metrices_chart.dart';
import 'package:coinranking/features/dashboard/data/models/coin_history_response.dart';
import 'package:coinranking/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

class BarChart extends StatelessWidget {
  const BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) =>
          current is GetCoinHistoryLoading || current is GetCoinHistorySuccess,
      builder: (context, state) {
        if (state is GetCoinHistorySuccess) {
          final List<PriceHistoryPoint> history = state.data.data.history;

          // ⚠️ Guard against empty list
          if (history.isEmpty) {
            return const SizedBox.shrink();
          }

          // Use double, not String
          final double basePrice = history.first.priceAsDouble;

          // X-axis labels (time)
          final List<String> xAxisLabels = history.map((e) {
            final h = e.dateTime.hour.toString().padLeft(2, '0');
            final m = e.dateTime.minute.toString().padLeft(2, '0');
            return '$h:$m';
          }).toList();

          // Y-axis values (price movement)
          final List<int> barData = history
              .map((e) => (e.priceAsDouble - basePrice).round())
              .toList();

          return Column(
            children: [
              buildBarChartCard(
                title: 'Price Movement',
                color: Colors.yellow,
                data: barData,
                xAxisLabels: xAxisLabels,
                showLegend: true,
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
