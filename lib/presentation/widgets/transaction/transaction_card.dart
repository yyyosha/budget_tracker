import 'package:budget_tracker/app/theme/colors.dart';
import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:budget_tracker/app/utils/parser.dart';
import 'package:budget_tracker/domain/models/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.item,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final TransactionModel item;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.radius),
        ),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        children: [
          _renderHeader(),
          Padding(
            padding: const EdgeInsets.all(AppSizes.paddingSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _renderInfo(),
                _renderActions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderHeader() {
    return Container(
      height: AppSizes.cardHeaderHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSizes.radius - 1),
          topRight: Radius.circular(AppSizes.radius - 1),
        ),
        color: item.type == EnumTransactionType.income
            ? AppColors.incomeColor
            : AppColors.expenseColor,
      ),
      child: Center(
        child: Text(
          DateFormat.yMMMMd('en_US').format(item.date),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _renderInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Amount: "
          "${Parser.doubleToString(
            item.amount,
            format: true,
          )} ${item.currency}",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSizes.paddingMedium),
        Text(
          "Category: ${item.category.name}",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _renderActions() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.edit_note_outlined),
          onPressed: onEdit,
        ),
        IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.delete_outlined),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
