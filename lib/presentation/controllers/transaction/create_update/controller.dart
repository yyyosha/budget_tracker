import 'package:budget_tracker/app/router/app_router.dart';
import 'package:budget_tracker/app/utils/parser.dart';
import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:budget_tracker/domain/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class TransactionCreateUpdateController extends GetxController {
  TransactionCreateUpdateController({
    required this.repository,
  });

  final ITransactionRepository repository;

  final amountController = TextEditingController();
  final amountControllerFocusNode = FocusNode();
  final amountControllerError = false.obs;
  final type = EnumTransactionType.income.obs;
  final category = TransactionCategory.values.first.obs;
  final transactionDate = DateTime.now().obs;
  final itemId = "".obs;
  final categories = TransactionCategory.values.obs;
  final Rx<TransactionModel?> item = TransactionModel.createFake().obs;

  @override
  Future<void> onInit() async {
    itemId.value = Get.arguments != null ? Get.arguments["id"] : "";
    if (itemId.value != "") {
      _fillFields(itemId.value);
    } else {
      categories.value = EnumTransactionIncomeCategory.values;
    }
    amountControllerFocusNode.addListener(() {
      if (!amountControllerFocusNode.hasFocus) {
        amountControllerError.value = amountController.value.text.isEmpty;
      }
    });
    super.onInit();
  }

  Future<void> save() async {
    if (itemId.value == "") {
      _onCreate();
    } else {
      _onUpdate();
    }
  }

  void changeCategory(int i) {
    type.value = EnumTransactionType.values[i];
    if (type.value == EnumTransactionType.income) {
      categories.value = EnumTransactionIncomeCategory.values;
    } else {
      categories.value = EnumTransactionExpenseCategory.values;
    }

    category.value = categories.first;
  }

  Future<void> _onCreate() async {
    amountControllerError.value = amountController.value.text.isEmpty;
    if (amountController.value.text.isNotEmpty) {
      final model = TransactionModel(
        id: const Uuid().v4(),
        amount: double.parse(amountController.value.text),
        type: type.value,
        category: category.value,
        date: transactionDate.value,
      );
      await repository.create(model);
      Get.offAndToNamed(Routes.transactionList);
    }
  }

  Future<void> _onUpdate() async {
    amountControllerError.value = amountController.value.text.isEmpty;
    if (amountController.value.text.isNotEmpty) {
      final model = TransactionModel(
        id: item.value!.id,
        amount: double.parse(amountController.text),
        type: type.value,
        category: category.value,
        date: transactionDate.value,
      );
      await repository.edit(model);
      Get.offAndToNamed(Routes.transactionList);
    }
  }

  Future<void> _fillFields(String id) async {
    item.value = await repository.get(id);
    amountController.text = Parser.doubleToString(item.value!.amount);
    category.value = item.value!.category;
    type.value = item.value!.type;
    transactionDate.value = item.value!.date;
    if (type.value == EnumTransactionType.income) {
      categories.value = EnumTransactionIncomeCategory.values;
    } else {
      categories.value = EnumTransactionExpenseCategory.values;
    }
  }
}
