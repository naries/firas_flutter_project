import 'package:firas_project/misc/app_colors.dart';
import 'package:firas_project/misc/widgets/app_text.dart';
import 'package:firas_project/view/widgets/tob_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            TopBar(
              title: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
