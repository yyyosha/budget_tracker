import 'package:budget_tracker/data/database/core/core_database.dart';
import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionDatabase extends ICoreDatabase<TransactionModel> {
  @override
  String get name => 'transactions';

  @override
  Future<List<TransactionModel>> all() async {
    final box = await Hive.openBox<TransactionModel>(name);
    return box.values.toList();
  }

  @override
  Future<TransactionModel?> get(String id) async {
    final box = await Hive.openBox<TransactionModel>(name);
    return box.get(id);
  }

  @override
  Future<String> create(TransactionModel model) async {
    final box = await Hive.openBox<TransactionModel>(name);
    box.put(model.id, model);
    return model.id;
  }

  @override
  Future<void> edit(TransactionModel model) async {
    final box = await Hive.openBox<TransactionModel>(name);
    await box.put(model.id, model);
  }

  @override
  Future<void> delete(String id) async {
    final box = await Hive.openBox<TransactionModel>(name);
    box.delete(id);
  }
}
