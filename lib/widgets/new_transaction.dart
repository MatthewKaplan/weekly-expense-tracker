import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  String titleInput;
  String amountInput;

  NewTransaction(this.addTransaction);

  void submitData() {
    final enteredAmount = double.parse(amountInput);

    if (titleInput.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(titleInput, enteredAmount);
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
              child: Text('Add Transaction'),
              textColor: Colors.blue[800],
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
