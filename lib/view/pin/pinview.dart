import 'package:firas_project/misc/app_colors.dart';
import 'package:firas_project/view/widgets/button.dart';
import 'package:firas_project/view/widgets/tob_bar.dart';
import 'package:flutter/material.dart';

class PinView extends StatelessWidget {
  const PinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const TopBar(
            title: 'Pin',
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.secondaryAppColor,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppButton(
                    'CONFIRM',
                    comparison: true,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
