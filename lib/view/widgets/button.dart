import 'package:firas_project/misc/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? func;
  final bool? comparison;
  final double? width;
  const AppButton(this.text,
      {this.func, this.comparison = false, this.width = 150, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        primary: comparison! ? AppColors.secondaryAppColor : Colors.white,
        textStyle: const TextStyle(fontSize: 20),
        minimumSize: Size(width as double, 40),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: comparison! ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
