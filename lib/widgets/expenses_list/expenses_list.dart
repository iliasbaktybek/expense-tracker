import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: expenses.length,
    //   itemBuilder: (ctx, index) => Dismissible(
    //     background: Container(
    //       color: Theme.of(context).colorScheme.error.withOpacity(0.65),
    //       margin: Theme.of(context).cardTheme.margin,
    //     ),
    //     key: ValueKey(expenses[index]),
    //     onDismissed: (direction) {
    //       onRemoveExpense(expenses[index]);
    //     },
    //     child: ExpenseItem(expenses[index]),
    //   ),
    // );
    return SizedBox(
      height: 370,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final expense in expenses)
              Dismissible(
                background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.65),
                  margin: Theme.of(context).cardTheme.margin,
                ),
                key: ValueKey(expense),
                onDismissed: (direction) {
                  onRemoveExpense(expense);
                },
                child: ExpenseItem(expense),
              ),
          ],
        ),
      ),
    );
  }
}
