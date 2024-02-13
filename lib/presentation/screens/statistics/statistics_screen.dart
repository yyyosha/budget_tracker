import 'package:budget_tracker/app/theme/colors.dart';
import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:budget_tracker/app/utils/parser.dart';
import 'package:budget_tracker/presentation/controllers/statistics/controller.dart';
import 'package:budget_tracker/presentation/screens/core/scaffold_with_navbar.dart';
import 'package:budget_tracker/presentation/widgets/charts/bar_chart.dart';
import 'package:budget_tracker/presentation/widgets/charts/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsScreen extends GetView<StatisticsController> {
  const StatisticsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Get.parameters["id"] != null) {
      controller.onRefresh();
    }
    return Obx(
      () => ScaffoldWithNavbar(
        currentIndex: 2,
        noData: controller.transactions.isEmpty,
        body: _renderCharts(),
      ),
    );
  }

  Widget _renderCharts() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Total",
            style: TextStyle(
              fontSize: AppSizes.fontSizeMedium,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppPieChart(
            data: [
              PieChartSectionData(
                title: "${Parser.doubleToString(
                  controller.incomeAmount.value,
                  format: true,
                )} EUR",
                color: AppColors.incomeColor,
                value: controller.incomeAmount.value,
              ),
              PieChartSectionData(
                title: "${Parser.doubleToString(
                  controller.expenseAmount.value,
                  format: true,
                )} EUR",
                color: AppColors.expenseColor,
                value: controller.expenseAmount.value,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.paddingLarge),
          const Text(
            "By Categories",
            style: TextStyle(
              fontSize: AppSizes.fontSizeMedium,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSizes.paddingLarge),
          AppBarChart(
            items: controller.transactions,
          ),
        ],
      ),
    );
  }
}
