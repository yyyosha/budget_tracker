import 'package:budget_tracker/domain/models/model_hive_id.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

sealed class TransactionCategory {
  static const List<TransactionCategory> values = [
    ...EnumTransactionIncomeCategory.values,
    ...EnumTransactionExpenseCategory.values,
  ];

  String get getString;
}

@HiveType(typeId: ModelHiveId.transactionType)
enum EnumTransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense;

  String get getString => switch (this) {
        income => 'Income',
        expense => 'Expense',
      };
}

@HiveType(typeId: ModelHiveId.transactionIncomeCategory)
enum EnumTransactionIncomeCategory implements TransactionCategory {
  @HiveField(0)
  salary,
  @HiveField(1)
  transfer,
  @HiveField(2)
  deposit;

  @override
  String get getString => switch (this) {
        salary => 'Salary',
        transfer => 'Transfer',
        deposit => 'Deposit',
      };
}

@HiveType(typeId: ModelHiveId.transactionExpenseCategory)
enum EnumTransactionExpenseCategory implements TransactionCategory {
  @HiveField(0)
  food,
  @HiveField(1)
  clothes,
  @HiveField(2)
  electronics,
  @HiveField(3)
  education,
  @HiveField(4)
  transport,
  @HiveField(5)
  internet,
  @HiveField(6)
  transfer,
  @HiveField(7)
  credit,
  @HiveField(8)
  bills;

  @override
  String get getString => switch (this) {
        food => 'Food',
        clothes => 'Clothes',
        electronics => 'Electronics',
        education => 'Education',
        transport => 'Transport',
        internet => 'Internet',
        transfer => 'Transfer',
        credit => 'Credit',
        bills => 'Bills',
      };
}

@HiveType(typeId: ModelHiveId.transaction)
class TransactionModel extends HiveObject {
  TransactionModel({
    required this.id,
    required this.amount,
    required this.type,
    required this.category,
    required this.createdAt,
    this.currency = "EUR",
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final String? currency;

  @HiveField(3)
  final EnumTransactionType type;

  @HiveField(4)
  final TransactionCategory category;

  @HiveField(5)
  final DateTime createdAt;

  factory TransactionModel.createFake() {
    return TransactionModel(
      id: "test-id-123",
      amount: 0,
      type: EnumTransactionType.income,
      category: TransactionCategory.values.first,
      createdAt: DateTime.now(),
    );
  }
}
