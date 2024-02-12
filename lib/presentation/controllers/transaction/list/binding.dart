import 'package:budget_tracker/data/repositories/transaction_repository_impl.dart';
import 'package:budget_tracker/presentation/controllers/transaction/list/controller.dart';
import 'package:get/get.dart';

class TransactionListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionListController>(
      () => TransactionListController(
        repository: Get.find<TransactionRepositoryImpl>(),
      ),
    );
  }
}
