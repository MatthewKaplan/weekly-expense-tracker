import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      body: Container(
        color: Colors.blueGrey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Column(
              children: transactions.map((transaction) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.blue[900],
                            width: 2,
                          )),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\$${transaction.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue[800],
                            ),
                          )),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transaction.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMd().format(transaction.date),
                              style: TextStyle(color: Colors.grey),
                            )
                          ])
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
