import 'package:budget_tracker/presentation/controllers/statistics/binding.dart';
import 'package:budget_tracker/presentation/controllers/transaction/create_update/binding.dart';
import 'package:budget_tracker/presentation/controllers/transaction/list/binding.dart';
import 'package:budget_tracker/presentation/screens/statistics/statistics_screen.dart';
import 'package:budget_tracker/presentation/screens/transaction/create_update/transaction_create_update_screen.dart';
import 'package:budget_tracker/presentation/screens/transaction/list/transaction_list_screen.dart';
import 'package:get/get.dart';

part 'routes.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: Routes.transactionList,
      page: () => const TransactionListScreen(),
      binding: TransactionListBinding(),
      maintainState: false,
    ),
    GetPage(
      name: Routes.statistics,
      page: () => const StatisticsScreen(),
      binding: StatisticsBinding(),
      maintainState: false,
    ),
    GetPage(
      name: Routes.transactionCreateUpdate,
      page: () => const TransactionCreateUpdateScreen(),
      binding: TransactionCreateUpdateBinding(),
    ),
  ];
}
