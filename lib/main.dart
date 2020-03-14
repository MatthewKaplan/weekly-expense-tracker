import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Expense Tracker'),
      ),
      body: Container(
        color: Colors.blueGrey[200],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  child: Text('Top Expense Chart',
                      style: TextStyle(color: Colors.blue[900])),
                  elevation: 3,
                ),
              ),
              UserTransactions()
            ],
          ),
        ),
      ),
    );
  }
}
