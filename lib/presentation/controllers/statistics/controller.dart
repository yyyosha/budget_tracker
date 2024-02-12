import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:budget_tracker/domain/repositories/transaction_repository.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  StatisticsController({
    required this.repository,
  });

  final ITransactionRepository repository;

  final transactions = [].obs;
  final categories = TransactionCategory.values;
  final incomeTransactions = [].obs;
  final expenseTransactions = [].obs;
  final incomeAmount = 0.0.obs;
  final expenseAmount = 0.0.obs;

  @override
  Future<void> onInit() async {
    final items = await repository.search();
    transactions.value = items;
    for (var i = 0; i < items.length; i++) {
      if (items[i].type == EnumTransactionType.income) {
        incomeTransactions.add(items[i]);
        incomeAmount.value += items[i].amount;
      } else {
        expenseTransactions.add(items[i]);
        expenseAmount.value += items[i].amount;
      }
    }
    super.onInit();
  }
}
