// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 0;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModel(
      id: fields[0] as String,
      amount: fields[1] as double,
      type: fields[3] as EnumTransactionType,
      category: fields[4] as TransactionCategory,
      createdAt: fields[5] as DateTime,
      currency: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnumTransactionTypeAdapter extends TypeAdapter<EnumTransactionType> {
  @override
  final int typeId = 1;

  @override
  EnumTransactionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EnumTransactionType.income;
      case 1:
        return EnumTransactionType.expense;
      default:
        return EnumTransactionType.income;
    }
  }

  @override
  void write(BinaryWriter writer, EnumTransactionType obj) {
    switch (obj) {
      case EnumTransactionType.income:
        writer.writeByte(0);
        break;
      case EnumTransactionType.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnumTransactionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnumTransactionIncomeCategoryAdapter
    extends TypeAdapter<EnumTransactionIncomeCategory> {
  @override
  final int typeId = 2;

  @override
  EnumTransactionIncomeCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EnumTransactionIncomeCategory.salary;
      case 1:
        return EnumTransactionIncomeCategory.transfer;
      case 2:
        return EnumTransactionIncomeCategory.deposit;
      default:
        return EnumTransactionIncomeCategory.salary;
    }
  }

  @override
  void write(BinaryWriter writer, EnumTransactionIncomeCategory obj) {
    switch (obj) {
      case EnumTransactionIncomeCategory.salary:
        writer.writeByte(0);
        break;
      case EnumTransactionIncomeCategory.transfer:
        writer.writeByte(1);
        break;
      case EnumTransactionIncomeCategory.deposit:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnumTransactionIncomeCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnumTransactionExpenseCategoryAdapter
    extends TypeAdapter<EnumTransactionExpenseCategory> {
  @override
  final int typeId = 3;

  @override
  EnumTransactionExpenseCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EnumTransactionExpenseCategory.food;
      case 1:
        return EnumTransactionExpenseCategory.clothes;
      case 2:
        return EnumTransactionExpenseCategory.electronics;
      case 3:
        return EnumTransactionExpenseCategory.education;
      case 4:
        return EnumTransactionExpenseCategory.transport;
      case 5:
        return EnumTransactionExpenseCategory.internet;
      case 6:
        return EnumTransactionExpenseCategory.transfer;
      case 7:
        return EnumTransactionExpenseCategory.credit;
      case 8:
        return EnumTransactionExpenseCategory.bills;
      default:
        return EnumTransactionExpenseCategory.food;
    }
  }

  @override
  void write(BinaryWriter writer, EnumTransactionExpenseCategory obj) {
    switch (obj) {
      case EnumTransactionExpenseCategory.food:
        writer.writeByte(0);
        break;
      case EnumTransactionExpenseCategory.clothes:
        writer.writeByte(1);
        break;
      case EnumTransactionExpenseCategory.electronics:
        writer.writeByte(2);
        break;
      case EnumTransactionExpenseCategory.education:
        writer.writeByte(3);
        break;
      case EnumTransactionExpenseCategory.transport:
        writer.writeByte(4);
        break;
      case EnumTransactionExpenseCategory.internet:
        writer.writeByte(5);
        break;
      case EnumTransactionExpenseCategory.transfer:
        writer.writeByte(6);
        break;
      case EnumTransactionExpenseCategory.credit:
        writer.writeByte(7);
        break;
      case EnumTransactionExpenseCategory.bills:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnumTransactionExpenseCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
