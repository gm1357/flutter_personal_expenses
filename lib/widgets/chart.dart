import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  Chart(this._recentTransactions);

  List<Map<String, Object>> get _groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var transaction in _recentTransactions) {
        if (_isSameDay(transaction.date, weekDay)) {
          totalSum += transaction.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  bool _isSameDay(DateTime dayOne, DateTime dayTwo) {
    return dayOne.day == dayTwo.day &&
        dayOne.month == dayTwo.month &&
        dayOne.year == dayTwo.year;
  }

  double get _TotalAmount {
    return _groupedTransactionsValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                amount: data['amount'],
                percentage: _TotalAmount == 0.0
                    ? 0.0
                    : (data['amount'] as double) / _TotalAmount,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
