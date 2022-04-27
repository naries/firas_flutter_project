import 'package:firas_project/misc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String name;
  final String amount;
  final String? time;
  final String? status;
  const HistoryCard(
      {required this.name,
      required this.amount,
      required this.time,
      required this.status,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: name,
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppText(text: amount),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: time!),
                  const SizedBox(
                    height: 10,
                  ),
                  AppText(
                    text: status!,
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
