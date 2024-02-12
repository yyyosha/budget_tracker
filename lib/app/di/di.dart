import 'package:budget_tracker/data/database/transaction.dart';
import 'package:budget_tracker/data/repositories/transaction_repository_impl.dart';
import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:budget_tracker/domain/repositories/transaction_repository.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void injectDependencies() {
  // Hive
  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(EnumTransactionTypeAdapter());
  Hive.registerAdapter(EnumTransactionIncomeCategoryAdapter());
  Hive.registerAdapter(EnumTransactionExpenseCategoryAdapter());
  // GetX
  Get.lazyPut<TransactionDatabase>(TransactionDatabase.new);
  Get.put<TransactionRepositoryImpl>(
    TransactionRepositoryImpl(
      database: TransactionDatabase(),
    ),
  );
  Get.lazyPut<ITransactionRepository>(
    () => TransactionRepositoryImpl(
      database: TransactionDatabase(),
    ),
  );
}
