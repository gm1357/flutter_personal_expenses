import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transactions_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'New TV',
      amount: 199.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'New Fridge',
      amount: 799.59,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionsList(_transactions),
      ],
    );
  }
}
