import 'package:firas_project/core/controllers/balance.dart';
import 'package:firas_project/misc/app_colors.dart';
import 'package:firas_project/misc/app_sizes.dart';
import 'package:firas_project/misc/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class BalanceView extends GetView<BalanceConroller> {
  const BalanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.account_balance_wallet,
                color: AppColors.mainAppColor,
                size: AppSize.bigIcon,
              ),
              const SizedBox(height: 15),
              const AppText(text: 'saldo'),
              const SizedBox(height: 5),
              Row(
                children: [
                  controller.obx(
                    (balance) => AppText(
                      text: '${balance!.currency} ${balance.balance as String}',
                      size: 24,
                    ),
                    onLoading: const SkeletonLine(
                      style: SkeletonLineStyle(
                        width: 100,
                        height: 24,
                      ),
                    ),
                    onError: (error) => const AppText(
                      text: "",
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      controller.fetchBalance();
                    },
                    child: Icon(Icons.refresh, color: AppColors.mainAppColor),
                  ),
                ],
              ),
            ],
          ),
          Container(
            // padding: EdgeInsets.all(value),
            child: Icon(
              Icons.add_circle_outline_sharp,
              color: AppColors.mainAppColor,
              size: AppSize.bigIcon,
            ),
          )
        ],
      ),
    );
  }
}
