import 'package:firas_project/misc/app_colors.dart';
import 'package:firas_project/misc/app_sizes.dart';
import 'package:firas_project/misc/widgets/app_text.dart';
import 'package:firas_project/view/home/views/product/balanceview.dart';
import 'package:firas_project/view/home/views/product/productview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 180,
                      width: Get.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            AppColors.mainAppColor,
                            AppColors.secondaryAppColor,
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                        // height: 180,
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        // decoration: BoxDecoration(color: Colors.white),
                        child: Column(children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/logo.jpg',
                                  height: 40,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                              // Container(
                              //   padding: const EdgeInsets.all(10),
                              //   decoration: const BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(10)),
                              //   ),
                              //   child: const Text('Whatever was hidden here'),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const BalanceView(),
                                const Divider(
                                  thickness: 2,
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.bar_chart,
                                              size: AppSize.smallIcon,
                                              color: AppColors.mainAppColor,
                                            ),
                                            const SizedBox(width: 8),
                                            AppText(
                                              text: 'PERFORMANCE',
                                              color: AppColors.mainAppColor,
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed('history');
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.history,
                                                color: AppColors.mainAppColor,
                                                size: AppSize.smallIcon,
                                              ),
                                              const SizedBox(width: 8),
                                              AppText(
                                                text: 'HISTORY',
                                                color: AppColors.mainAppColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ]))
                  ],
                ),
                const ProductView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
