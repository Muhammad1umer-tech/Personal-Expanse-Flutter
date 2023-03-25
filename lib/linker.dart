import 'package:flutter/material.dart';
import 'Transactionlist.dart';
import 'Transaction.dart';

class linker extends StatefulWidget {
  @override
  State<linker> createState() => _linkerState();
}

class _linkerState extends State<linker> {
  List<Transaction> transaction = [
    //Transaction("id", "hello", 55, DateTime.now())
  ];
  void _addnew_transaction(String str, double num) {
    var temp = Transaction(DateTime.now().toString(), str, num, DateTime.now());

    setState(() {
      transaction.add(temp);
    });
  }

  void delete_Transaction(String i) {
    for (int a = 0; a < transaction.length; a++) {
      if (transaction[a].id == i) {
        setState(() {
          transaction.remove(transaction[a]);
        });
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //textfieldd(_addnew_transaction),
        Transactionlist(transaction, delete_Transaction)
      ],
    );
  }
}
