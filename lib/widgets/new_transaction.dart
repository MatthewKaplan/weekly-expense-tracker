import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String titleInput;
  String amountInput;

  void submitData() {
    final enteredAmount = double.parse(amountInput);

    if (titleInput.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(titleInput, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (val) => titleInput = val,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onChanged: (val) => amountInput = val,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  )),
              color: Theme.of(context).primaryColorDark,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
