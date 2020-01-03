import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteFunction;

  TransactionsList(this._transactions, this._deleteFunction);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset('assets/images/waiting.png'),
              ),
            ],
          );
        })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 8,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                            '\$ ${_transactions[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    _transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_transactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => _deleteFunction(_transactions[index].id),
                  ),
                ),
              );
            },
            itemCount: _transactions.length,
          );
  }
}
