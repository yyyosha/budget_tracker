import 'package:budget_tracker/data/repositories/transaction_repository_impl.dart';
import 'package:budget_tracker/presentation/controllers/transaction/create_update/controller.dart';
import 'package:get/get.dart';

class TransactionCreateUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionCreateUpdateController>(
      () => TransactionCreateUpdateController(
        repository: Get.find<TransactionRepositoryImpl>(),
      ),
    );
  }
}
