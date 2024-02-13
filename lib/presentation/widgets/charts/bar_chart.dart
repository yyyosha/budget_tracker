import 'package:budget_tracker/app/utils/parser.dart';
import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AppBarChart extends StatelessWidget {
  const AppBarChart({
    required this.items,
    this.height = 300.0,
    super.key,
  });

  final List<TransactionModel> items;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: BarChart(
        BarChartData(
          titlesData: _titleData(),
          barTouchData: _barTouchData(),
          borderData: FlBorderData(
            border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
            ),
          ),
          barGroups: _chartGroups(),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    final List<BarChartGroupData> barItems = [];
    for (var i = 0; i < TransactionCategory.values.length; i++) {
      barItems.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              fromY: 0,
              toY: _sumByCategory(TransactionCategory.values[i]),
              width: 20,
              color: TransactionCategory.values[i].color,
              borderRadius: BorderRadius.zero,
            ),
          ],
        ),
      );
    }
    return barItems;
  }

  double _sumByCategory(TransactionCategory category) {
    return items
        .where((el) => el.category == category)
        .map((el) => el.amount)
        .fold(0, (p, c) => p + c);
  }

  FlTitlesData _titleData() {
    return FlTitlesData(
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          reservedSize: 36,
          showTitles: true,
          getTitlesWidget: (val, meta) {
            return Icon(
              TransactionCategory.values[val.toInt()].icon,
            );
          },
        ),
      ),
    );
  }

  BarTouchData _barTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        getTooltipItem: (group, i, data, y) => BarTooltipItem(
          "${TransactionCategory.values[i].name}\n"
              "${Parser.doubleToString(data.toY, format: true)} EUR",
          const TextStyle(),
        ),
        tooltipBgColor: Colors.white,
        tooltipBorder: const BorderSide(),
      ),
    );
  }
}
