import 'package:budget_tracker/app/theme/colors.dart';
import 'package:budget_tracker/domain/models/model_hive_id.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

sealed class TransactionCategory {
  static const List<TransactionCategory> values = [
    ...EnumTransactionIncomeCategory.values,
    ...EnumTransactionExpenseCategory.values,
  ];

  String get name;

  Color get color;

  IconData get icon;
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
  String get name => switch (this) {
        salary => 'Salary',
        transfer => 'Transfer',
        deposit => 'Deposit',
      };

  @override
  Color get color => AppColors.incomeColor;

  @override
  IconData get icon => switch (this) {
    salary => Icons.work_outline_rounded,
    transfer => Icons.payments_outlined,
    deposit => Icons.percent_outlined,
  };
}

@HiveType(typeId: ModelHiveId.transactionExpenseCategory)
enum EnumTransactionExpenseCategory implements TransactionCategory {
  @HiveField(0)
  food,
  @HiveField(1)
  internet,
  @HiveField(2)
  clothes,
  @HiveField(3)
  electronics,
  @HiveField(4)
  transport,
  @HiveField(5)
  credit,
  @HiveField(6)
  bills;

  @override
  String get name => switch (this) {
        food => 'Food',
        clothes => 'Clothes',
        electronics => 'Electronics',
        transport => 'Transport',
        internet => 'Internet',
        credit => 'Credit',
        bills => 'Bills',
      };

  @override
  Color get color => AppColors.expenseColor;

  @override
  IconData get icon => switch (this) {
    food => Icons.fastfood_outlined,
    clothes => Icons.account_circle_outlined,
    electronics => Icons.monitor_outlined,
    transport => Icons.emoji_transportation,
    internet => Icons.wifi,
    credit => Icons.account_balance_outlined,
    bills => Icons.list_alt_outlined,
  };
}

@HiveType(typeId: ModelHiveId.transaction)
class TransactionModel extends HiveObject {
  TransactionModel({
    required this.id,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
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
  final DateTime date;

  factory TransactionModel.createFake() {
    return TransactionModel(
      id: "test-id-123",
      amount: 0,
      type: EnumTransactionType.income,
      category: TransactionCategory.values.first,
      date: DateTime.now(),
    );
  }
}
