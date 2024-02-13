import 'package:budget_tracker/domain/models/transaction/transaction.dart';

abstract class ITransactionRepository {
  Future<List<TransactionModel>> search();

  Future<TransactionModel?> get(String id);

  Future<void> create(TransactionModel model);

  Future<void> edit(TransactionModel model);

  Future<void> delete(String id);
}