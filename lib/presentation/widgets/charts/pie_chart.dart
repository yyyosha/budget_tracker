import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AppPieChart extends StatelessWidget {
  const AppPieChart({
    required this.data,
    this.height = 300.0,
    this.centerRadius = 80.0,
    super.key,
  });

  final double height;
  final double centerRadius;
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
                fontSize: 18.0,
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
                        titlePositionPercentageOffset: 0.5,
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
