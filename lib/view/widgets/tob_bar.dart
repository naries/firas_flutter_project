import 'package:firas_project/misc/app_colors.dart';
import 'package:firas_project/misc/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget {
  final String title;

  const TopBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: AppColors.mainAppColor),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          AppText(
            text: title,
            color: Colors.white,
            size: 18,
          ),
        ],
      ),
    );
  }
}
