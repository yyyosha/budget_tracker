import 'package:budget_tracker/app/router/app_router.dart';
import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:budget_tracker/presentation/controllers/transaction/create_update/controller.dart';
import 'package:budget_tracker/presentation/screens/core/app_bar.dart';
import 'package:budget_tracker/presentation/widgets/core/text_field.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
              child: Obx(
                () => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _renderTypeSelect(),
                        _renderCategorySelect(),
                      ],
                    ),
                    const SizedBox(height: AppSizes.paddingMedium),
                    _renderCalendarSelect(context),
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
      ),
    );
  }

  Widget _renderTypeSelect() {
    return ToggleButtons(
      fillColor: Colors.transparent,
      splashColor: Colors.transparent,
      selectedColor: controller.type.value.color,
      selectedBorderColor: controller.type.value.color,
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
                e.name,
                style: const TextStyle(
                  fontSize: AppSizes.fontSizeSmall,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _renderCategorySelect() {
    return Row(
      children: [
        const Text(
          "Category:",
          style: TextStyle(
            fontSize: AppSizes.fontSizeSmall,
          ),
        ),
        const SizedBox(width: AppSizes.paddingSmall),
        DropdownButton(
          value: controller.category.value,
          onChanged: (item) => {
            controller.category.value = item!,
          },
          items: controller.categories
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
        ),
      ],
    );
  }

  Widget _renderCalendarSelect(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Date: ${DateFormat.yMMMMd('en_US').format(
            controller.transactionDate.value,
          )}",
          style: const TextStyle(
            fontSize: AppSizes.fontSizeSmall,
          ),
        ),
        OutlinedButton(
          onPressed: () => _showCalendar(context),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.radius),
                ),
              ),
            ),
          ),
          child: const Text("Change Date"),
        ),
      ],
    );
  }

  Future<void> _showCalendar(BuildContext context) async {
    final dateTime = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(),
      dialogSize: const Size(325, 400),
      value: [controller.transactionDate.value],
      borderRadius: BorderRadius.circular(AppSizes.radius),
    );
    controller.transactionDate.value =
        dateTime != null ? dateTime[0]! : DateTime.now();
  }
}
