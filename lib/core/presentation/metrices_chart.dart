import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/utils/utils.dart';

// Adjust import path as needed

Widget buildBarChartCard({
  required String title,
  required Color color,
  required List<int> data,
  required List<String> xAxisLabels,
  bool showLegend = false,
}) {
  // Determine the max Y value for the chart's axis.
  // Add some padding (e.g., 2) to the max value for better visual spacing.
  double maxY = data.isEmpty
      ? 10.0
      : (data.reduce((a, b) => a > b ? a : b) + 2).toDouble();
  if (maxY < 10) maxY = 10;

  final formattedLabels = xAxisLabels.map(formatXAxisLabel).toList();
  final int maxVisible = 6;
  int skipFactor = (formattedLabels.length / maxVisible).ceil();
  if (skipFactor < 1) skipFactor = 1;
  List<BarChartGroupData> barGroups = List.generate(data.length, (index) {
    return BarChartGroupData(
      x: index,
      barRods: [
        BarChartRodData(
          toY: data[index].toDouble(),
          color: color,
          width: 9, // Width of each bar
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3),
            topRight: Radius.circular(3),
          ), // Rounded only at the top
        ),
      ],
    );
  });

  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: ColorsConstant.stroke, width: 2),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLegend)
            Container(
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white, // Text color for the legend
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white, // Text color for the title
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          SizedBox(height: 15),
          AspectRatio(
            aspectRatio: 1.2, // Adjust aspect ratio as needed
            child: BarChart(
              BarChartData(
                barGroups: barGroups,
                backgroundColor: Colors.transparent,
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(
                      color: ColorsConstant.stroke,
                      width: 0.74,
                    ), // X-axis line
                    left: BorderSide(
                      color: ColorsConstant.stroke,
                      width: 0.74,
                    ), // Y-axis line
                    top: BorderSide(
                      color: ColorsConstant.stroke,
                      width: 0.74,
                    ), // Y-axis line
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) => FlLine(
                    dashArray: [2, 5],
                    color: ColorsConstant.stroke,
                    strokeWidth: 0.74,
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    dashArray: [2, 5],
                    color: ColorsConstant.stroke,
                    strokeWidth: 0.74,
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final idx = value.toInt();
                        if (idx < 0 || idx >= formattedLabels.length)
                          return const SizedBox.shrink();

                        // Show only every skipFactor label
                        if (idx % skipFactor == 0) {
                          final text = formattedLabels[idx];
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Transform.rotate(
                              angle:
                                  -math.pi /
                                  12, // slight tilt, remove if you don't want rotation
                              child: Text(
                                text,
                                style: TextStyle(
                                  color: ColorsConstant.greyText,
                                  fontSize:
                                      11, // reduce font a bit if space is tight
                                ),
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value % 1 == 0) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: ColorsConstant.greyText,
                              fontSize: 12,
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                maxY: maxY, // Set max Y value
                minY: null,
                alignment: BarChartAlignment.spaceAround,
                groupsSpace: 10, // Space between bar groups
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
