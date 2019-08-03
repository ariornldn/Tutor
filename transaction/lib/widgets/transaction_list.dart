import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transcations added yet',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Colors.black,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Colors.blue,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
