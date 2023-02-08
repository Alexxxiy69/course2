import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';

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
      id: 't1',
      title: 'Jordans',
      amount: 69,
      date: DateTime.now(),
    )
  ];
  late String titleInput;
  late String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            child: Card(
              color: Colors.greenAccent,
              elevation: 5,
              child: Container(
                width: 100,
                child: Text('CHART!'),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'title'),
                    onChanged: (val) {
                      titleInput = val;
                    },
                  ),
                  TextField
                    (decoration: InputDecoration(labelText: 'amount'),
                    onChanged: (val) {
                      amountInput = val;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      print(titleInput);
                      print(amountInput);
                    },
                    child: const Text('add transaction'),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    child: Text(
                      '\$${tx.amount}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tx.title,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(DateFormat('yyyy-MM-dd').format(tx.date),
                          style: TextStyle(color: Colors.grey, fontSize: 10))
                    ],
                  ),
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
