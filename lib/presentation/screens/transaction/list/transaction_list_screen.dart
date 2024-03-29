import 'package:budget_tracker/app/router/app_router.dart';
import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:budget_tracker/presentation/controllers/transaction/list/controller.dart';
import 'package:budget_tracker/presentation/screens/core/scaffold_with_navbar.dart';
import 'package:budget_tracker/presentation/widgets/transaction/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionListScreen extends GetView<TransactionListController> {
  const TransactionListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Get.parameters["id"] != null) {
      controller.onRefresh();
    }
    return Obx(
      () => ScaffoldWithNavbar(
        currentIndex: 0,
        noData: controller.transactions.isEmpty,
        body: ListView.separated(
          itemCount: controller.transactions.length,
          separatorBuilder: (_, index) => const SizedBox(
            height: AppSizes.paddingMedium,
          ),
          itemBuilder: (_, index) {
            return TransactionCard(
              item: controller.transactions[index],
              onEdit: () => Get.toNamed(
                Routes.transactionCreateUpdate,
                parameters: {"id": controller.transactions[index].id},
              ),
              onDelete: () {
                controller.delete(controller.transactions[index].id);
              },
            );
          },
        ),
      ),
    );
  }
}
