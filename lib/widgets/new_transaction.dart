import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final Function _addFunction;

  NewTransaction(this._addFunction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              textColor: Colors.purple,
              child: Text('Add Transaction'),
              onPressed: () => _addFunction(
                _titleController.text,
                double.parse(_amountController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
