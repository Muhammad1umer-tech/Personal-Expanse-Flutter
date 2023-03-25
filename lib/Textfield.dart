import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_app/chart.dart';

class textfieldd extends StatefulWidget {
  final Function func;
  textfieldd(this.func);

  @override
  State<textfieldd> createState() => _textfielddState();
}

class _textfielddState extends State<textfieldd> {
  String str;

  double num;

  DateTime date;

  @override
  Widget build(BuildContext context) {
    void datepicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2022),
              lastDate: DateTime.now())
          .then((value) {
        if (value == null) return;

        setState(() {
          date = value;
        });
      });
    }

    void submitdata() {
      if (date == null || str == null || num <= 0) return;

      widget.func(str, num, date);
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => str = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a Title',
              ),
            ),
            TextField(
              onChanged: (value) => num = double.parse(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a Amount',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: ElevatedButton(
                      onPressed: submitdata,
                      child: Text("Add New Transaction")),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: datepicker,
                        child: Text("Add Date"),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: 0),
                        child: Text(
                            "${date == null ? "     NA  " : DateFormat.MEd().format(date)}"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
