import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:budget_tracker/domain/repositories/transaction_repository.dart';
import 'package:get/get.dart';

class TransactionListController extends GetxController {
  TransactionListController({
    required this.repository,
  });

  final ITransactionRepository repository;

  final RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  @override
  Future<void> onInit() async {
    onRefresh();
    super.onInit();
  }

  Future<List<TransactionModel>> search() async {
    final items = await repository.search();
    return items;
  }

  Future<void> delete(String id) async {
    await repository.delete(id);
    transactions.removeWhere((el) => el.id == id);
  }

  Future<void> onRefresh() async {
    final items = await search();
    transactions.clear();
    transactions.addAll(items);
    transactions.sort((a, b) => b.date.compareTo(a.date));
  }
}
