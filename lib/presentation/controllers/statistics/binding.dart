import 'package:budget_tracker/data/repositories/transaction_repository_impl.dart';
import 'package:budget_tracker/presentation/controllers/statistics/controller.dart';
import 'package:get/get.dart';

class StatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticsController>(
          () => StatisticsController(
        repository: Get.find<TransactionRepositoryImpl>(),
      ),
    );
  }
}
