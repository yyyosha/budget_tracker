import 'package:budget_tracker/app/router/app_router.dart';
import 'package:budget_tracker/app/theme/colors.dart';
import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:budget_tracker/presentation/controllers/transaction/create_update/controller.dart';
import 'package:budget_tracker/presentation/screens/core/app_bar.dart';
import 'package:budget_tracker/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionCreateUpdateScreen
    extends GetView<TransactionCreateUpdateController> {
  const TransactionCreateUpdateScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: BtAppBar(
          title: controller.itemId.value == ""
              ? "Add transaction"
              : "Edit transaction",
          onBack: () {
            Get.offAndToNamed(Routes.transactionList);
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.paddingLarge,
              horizontal: AppSizes.paddingMedium,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ToggleButtons(
                          fillColor: Colors.transparent,
                          splashColor: AppColors.incomeColor,
                          selectedColor: AppColors.incomeColor,
                          selectedBorderColor: AppColors.incomeColor,
                          onPressed: controller.changeCategory,
                          isSelected: EnumTransactionType.values
                              .map((e) => e == controller.type.value)
                              .toList(),
                          children: EnumTransactionType.values
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSizes.paddingCore,
                                  ),
                                  child: Text(
                                    e.getString,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const Text(
                          "Category:",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        DropdownButton(
                          
                          value: controller.category.value,
                          onChanged: (item) => {
                            controller.category.value = item!,
                          },
                          items: controller.categories
                              .map(
                                (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e.getString,
                                    )),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSizes.paddingMedium),
                  CustomTextFormField(
                    controller: controller.amountController,
                    validationError: controller.amountControllerError.value,
                    maxLines: 1,
                    hintText: "Enter amount of funds",
                  ),
                  const SizedBox(height: AppSizes.paddingLarge),
                  OutlinedButton(
                    onPressed: controller.save,
                    child: const Text("Save"),
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
