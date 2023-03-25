import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Transaction.dart';

class Transactionlist extends StatefulWidget {
  final List<Transaction> transaction;
  final Function func;
  Transactionlist(this.transaction, this.func);

  @override
  State<Transactionlist> createState() => _TransactionlistState();
}

class _TransactionlistState extends State<Transactionlist> {
  Color ind;

  @override
  void initState() {
    const color = [Colors.red, Colors.purple, Colors.blue];
    ind = color[Random().nextInt(3)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return widget.transaction.isEmpty
          ? Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Container(
                      height: constraints.maxHeight * .05,
                      child: const FittedBox(
                        child: Text(
                          "No Transaction !!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Container(
                    height: constraints.maxHeight * .5,
                    child: Image.asset(
                      "lib/image/zzz.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ))
          : Card(
              elevation: 20,
              child: Container(
                height: constraints.maxHeight,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 20,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: ind,
                          radius: 30,
                          child: Text(
                              '\$ ${widget.transaction[index].amount.toStringAsFixed(0)}'),
                        ),
                        title: Text(widget.transaction[index].title),
                        subtitle: Text(DateFormat.yMEd()
                            .format(widget.transaction[index].date)),
                        trailing: MediaQuery.of(context).size.width > 300
                            ? TextButton.icon(
                                label: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () =>
                                    widget.func(widget.transaction[index].id),
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () =>
                                    widget.func(widget.transaction[index].id),
                              ),
                      ),
                    );
                  },
                  itemCount: widget.transaction.length,
                ),
              ),
            );
    });
  }
}
