import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 385,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              SizedBox(height: 50,),
              Text('No transactions added yet!',
                  style: TextStyle(fontSize: 24)),
              SizedBox(height: 50,),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ])
          : SingleChildScrollView(
              child: Column(
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
                              color: Theme.of(context).primaryColor,
                              width: 1.5,
                            )),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '\$${transaction.amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).primaryColorDark,
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
                                style: TextStyle(color: Colors.grey[800]),
                              )
                            ])
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
