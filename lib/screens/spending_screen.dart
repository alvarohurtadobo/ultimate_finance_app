// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_finance_app/blocs/income_expense/income_expense_bloc.dart';
import 'package:ultimate_finance_app/blocs/income_expense/income_expense_state.dart';
import 'package:ultimate_finance_app/widgets/budget_card.dart';
import 'package:ultimate_finance_app/widgets/category_list.dart';
// import 'package:ultimate_finance_app/widgets/line_chart_widget.dart';

class SpendingScreen extends StatelessWidget {
  const SpendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.appBarTheme.foregroundColor,
      appBar: AppBar(title: const Text('My Spending')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: BlocBuilder<IncomeExpenseBloc, IncomeExpenseState>(
                builder: (context, state) {
                  if (state is TransactionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TransactionLoaded) {
                    // final monthlyData = _calculateMonthlyData(
                    //   state.transactions,
                    // );
                    // return LineChartWidget(monthlyData: monthlyData);
                    return Container();
                  } else if (state is TransactionError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('No transactions found'));
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            const BudgetCard(
              title: "Budget for October",
              amount: "\$2,478",
              progress: 0.5,
            ),
            const SizedBox(height: 16),
            const Expanded(flex: 3, child: CategoryList()),
          ],
        ),
      ),
    );
  }

  // List<FlSpot> _calculateMonthlyData(List transactions) {
  //   final monthlyTotals = List.generate(12, (index) => 0.0);

  //   for (var transaction in transactions) {
  //     if (transaction.type == 'expense') {
  //       final month = transaction.date.month - 1;
  //       monthlyTotals[month] += transaction.amount;
  //     }
  //   }

  //   return List.generate(
  //     12,
  //     (index) => FlSpot(index.toDouble(), monthlyTotals[index]),
  //   );
  // }
}
