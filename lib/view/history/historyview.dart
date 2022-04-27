import 'package:firas_project/core/controllers/history.dart';
import 'package:firas_project/misc/app_colors.dart';
import 'package:firas_project/misc/widgets/app_text.dart';
import 'package:firas_project/view/history/widgets/history_card.dart';
import 'package:firas_project/view/widgets/tob_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends GetView<HistoryController> {
  History({Key? key}) : super(key: key);
  final items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    RxString value = "January".obs;
    RxString currentTab = "purchase".obs;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBar(
              title: 'History',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    currentTab.value = "purchase";
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: currentTab.value == "purchase"
                                ? AppColors.mainAppColor
                                : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                      ),
                      width: Get.width / 2,
                      child: AppText(
                        text: 'PURCHASE',
                        textAlign: TextAlign.center,
                        color: currentTab.value == "purchase"
                            ? AppColors.mainAppColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    currentTab.value = "deposit";
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: currentTab.value == "deposit"
                                ? AppColors.mainAppColor
                                : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                      ),
                      width: Get.width / 2,
                      child: AppText(
                          text: 'DEPOSIT',
                          textAlign: TextAlign.center,
                          color: currentTab.value == "deposit"
                              ? AppColors.mainAppColor
                              : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Obx(
                () => DropdownButton<String>(
                  value: controller.value.value,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (String? item) {
                    controller.updateValue(item);
                  },
                ),
              ),
            ),
            Obx(() => currentTab.value == "purchase"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: AppText(
                          text: '09 Mar 2021',
                          weight: FontWeight.bold,
                        ),
                      ),
                      HistoryCard(
                        name: "name",
                        amount: "NTD 1000",
                        status: "UNPAID",
                        time: '12:00',
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: AppText(
                            text: '09 Mar 2021',
                            weight: FontWeight.bold,
                          ),
                        ),
                        HistoryCard(
                          name: "name",
                          amount: "NTD 1000",
                          status: "UNPAID",
                          time: '12:00',
                        ),
                        HistoryCard(
                          name: "Seven Eleven",
                          amount: "NTD 1000",
                          status: "UNPAID",
                          time: '12:00',
                        ),
                      ])),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
