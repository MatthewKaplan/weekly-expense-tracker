import 'package:flutter/material.dart';

import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'Basketball Shoes',
      amount: 89.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Groceries',
      amount: 64.29,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Expense Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Top Expense Chart'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(child: Text(transaction.amount.toString())),
                    Column(children: <Widget>[
                      Text(transaction.title),
                      Text(transaction.date.toString())
                    ])
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
