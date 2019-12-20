import 'package:flutter/material.dart';

import 'package:personal_expenses/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'New TV',
      amount: 1999.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'New Fridge',
      amount: 799.59,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Text(tx.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
