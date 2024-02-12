import 'package:budget_tracker/app/theme/colors.dart';
import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:budget_tracker/presentation/controllers/statistics/controller.dart';
import 'package:budget_tracker/presentation/screens/core/scaffold_with_navbar.dart';
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
    return ScaffoldWithNavbar(
      currentIndex: 2,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.paddingMedium,
            horizontal: AppSizes.paddingMedium,
          ),
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  AppPieChart(
                    data: [
                      PieChartSectionData(
                        title: "${controller.incomeAmount.value} EUR",
                        color: AppColors.incomeColor,
                        value: controller.incomeAmount.value,
                      ),
                      PieChartSectionData(
                        title: "${controller.expenseAmount.value} EUR",
                        color: AppColors.expenseColor,
                        value: controller.expenseAmount.value,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
