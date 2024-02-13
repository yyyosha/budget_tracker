import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AppPieChart extends StatelessWidget {
  const AppPieChart({
    required this.data,
    this.height = 300.0,
    this.centerRadius = 1.0,
    this.sectionRadius = 130.0,
    super.key,
  });

  final double height;
  final double centerRadius;
  final double sectionRadius;
  final List<PieChartSectionData> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: data.every((e) => e.value == 0.0)
          ? const Center(
              child: Text(
              "You don't have such transactions",
              style: TextStyle(
                fontSize: AppSizes.fontSizeMedium,
              ),
            ))
          : PieChart(
              PieChartData(
                centerSpaceRadius: centerRadius,
                sections: data
                    .map(
                      (item) => PieChartSectionData(
                        title: item.title,
                        titleStyle: const TextStyle(color: Colors.white),
                        titlePositionPercentageOffset: 0.55,
                        radius: sectionRadius,
                        color: item.color,
                        value: item.value,
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }
}
