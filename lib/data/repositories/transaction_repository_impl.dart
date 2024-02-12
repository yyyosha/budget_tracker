import 'package:budget_tracker/data/database/transaction.dart';
import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:budget_tracker/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl extends ITransactionRepository {
  TransactionRepositoryImpl({
    required this.database,
  });

  final TransactionDatabase database;

  @override
  Future<List<TransactionModel>> search() async {
    return await database.all();
  }

  @override
  Future<TransactionModel?> get(String id) async {
    return await database.get(id);
  }

  @override
  Future<String> create(TransactionModel model) async {
    return await database.create(model);
  }

  @override
  Future<void> edit(TransactionModel model) async {
    await database.edit(model);
  }

  @override
  Future<void> delete(String id) async {
    await database.delete(id);
  }
}
