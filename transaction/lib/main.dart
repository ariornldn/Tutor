import 'package:flutter/material.dart';
import 'package:transaction/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'Test1',
      title: 'New Jeans',
      amount: 79.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Test2',
      title: 'New Backpack',
      amount: 59.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Test3',
      title: 'New Shoes',
      amount: 159.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Test4',
      title: 'New Wallet',
      amount: 29.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Test5',
      title: 'New Phone',
      amount: 599.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Test6',
      title: 'New Camera',
      amount: 489.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Test7',
      title: 'New Jacket',
      amount: 89.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Test8',
      title: 'New Watch',
      amount: 269.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Test9',
      title: 'New Shirt',
      amount: 49.0,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txamount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _starAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _starAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _starAddNewTransaction(context),
      ),
    );
  }
}

class edun extends StatefulWidget {
  @override
  _edunState createState() => _edunState();
}

class _edunState extends State<edun> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
