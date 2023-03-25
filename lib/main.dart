import 'dart:convert';
import 'package:flutter/material.dart';
import 'linker.dart';
import 'Textfield.dart';
import 'Transactionlist.dart';
import 'Transaction.dart';
import 'chart.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expense",
      home: myhomepage(),
    );
  }
}

class myhomepage extends StatefulWidget {
  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  List<Transaction> transaction = [
    //Transaction("id", "hello", 55, DateTime.now())
  ];
  void _addnew_transaction(String str, double num, DateTime dat) {
    var temp = Transaction(DateTime.now().toString(), str, num, dat);

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

  void textfield_modal() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return textfieldd(_addnew_transaction);
        });
  }

  Widget func() {
    return Container(
        height: (MediaQuery.of(context).size.height -
                app.preferredSize.height -
                window.padding.top / window.devicePixelRatio) *
            .2,
        child: chart(transaction));
  }

  // final varr11 = Container(
  //   height: (MediaQuery.of(context).size.height -
  //           app.preferredSize.height -
  //           window.padding.top / window.devicePixelRatio) *
  //       .2,
  //   child: chart(transaction));             it will generate an error.
  final app = AppBar(
    title: const Center(
      child: Text("Personal Expense"),
    ),
  );
  bool _flag = true;
  @override
  Widget build(BuildContext context) {
    final varr11 = Container(
        height: (MediaQuery.of(context).size.height -
                app.preferredSize.height -
                window.padding.top / window.devicePixelRatio) *
            .2,
        child: chart(transaction));
    final varr1 = Container(
        height: (MediaQuery.of(context).size.height -
                app.preferredSize.height -
                window.padding.top / window.devicePixelRatio) *
            .7,
        child: chart(transaction));

    final varr = Container(
        height: (MediaQuery.of(context).size.height -
                app.preferredSize.height -
                window.padding.top / window.devicePixelRatio) *
            1,
        child: Transactionlist(transaction, delete_Transaction));

    final landscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: app,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (landscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Show Chart"),
                  Switch.adaptive(
                    value: _flag,
                    onChanged: (value) {
                      setState(() {
                        _flag = value;
                      });
                    },
                  )
                ],
              ),
            if (!landscape) func(),
            if (!landscape) varr,
            if (landscape) _flag == true ? varr1 : varr,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: textfield_modal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
