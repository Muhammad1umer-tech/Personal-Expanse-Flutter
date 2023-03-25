import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Transaction.dart';
import 'charttype.dart';
import 'chartbar.dart';

class chart extends StatelessWidget {
  final List<Transaction> transaction;
  chart(this.transaction);

  List<Charttpye> get weekly_transaction {
    // ignore: missing_return
    return List.generate(7, (index) {
      var totalsum = 0.0;
      var total = 0.0;
      final weekday = DateTime.now().subtract(Duration(days: index));

      for (int a = 0; a < transaction.length; a++) {
        if (transaction[a].date.day == weekday.day) {
          total += transaction[a].amount;
        }
        totalsum += transaction[a].amount;
      }

      double percentage = total / totalsum;
      var temp = Charttpye(
          total,
          DateFormat.E().format(weekday).substring(0, 1),
          totalsum == 0.0 ? 0.0 : percentage);
      //print(DateFormat.E().format(weekday).substring(0, 1));
      return temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(weekly_transaction);
    return Container(
      child: chartbar(weekly_transaction),
    );
  }
}
