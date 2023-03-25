import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'Transaction.dart';
import 'charttype.dart';

class chartbar extends StatelessWidget {
  final List<Charttpye> transaction;
  chartbar(this.transaction);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constainers) {
      return Card(
        margin: EdgeInsets.only(
            left: 20, right: 20, top: constainers.maxHeight * .06),
        elevation: 10,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: transaction.map((e) {
              return Column(
                children: [
                  Container(
                    height: constainers.maxHeight * .10,
                    child: FittedBox(
                      child: Text(e.amount.toString()),
                    ),
                  ),
                  SizedBox(height: constainers.maxHeight * .05),
                  Container(
                    height: constainers.maxHeight * .6,
                    width: 10,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            color: Color.fromARGB(255, 212, 209, 209),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        FractionallySizedBox(
                          heightFactor: e.percentage,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constainers.maxHeight * .05),
                  Container(
                      height: constainers.maxHeight * .10,
                      child: FittedBox(
                        child: Text(e.day),
                      )),
                ],
              );
            }).toList()),
      );
    });
  }
}
