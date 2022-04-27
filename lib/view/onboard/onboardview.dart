import 'package:firas_project/core/bindings/history.dart';
import 'package:firas_project/core/bindings/products.dart';
import 'package:firas_project/view/history/historyview.dart';
import 'package:firas_project/view/home/homeview.dart';
import 'package:firas_project/view/home/views/product/productview.dart';
import 'package:firas_project/view/pin/pinview.dart';
import 'package:firas_project/view/product/productview.dart';
import 'package:firas_project/view/unknown_page_route/unkown_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'onboard',
      unknownRoute: GetPage(name: '/notfound', page: () => const UnknownPage()),
      getPages: [
        GetPage(
          name: '/onboard',
          page: () => const HomeView(),
          binding: ProductBinding(),
        ),
        GetPage(
          name: '/history',
          page: () => History(),
          transition: Transition.downToUp,
          binding: HistoryBinding(),
          transitionDuration: const Duration(milliseconds: 100),
        ),
        GetPage(
          name: '/product',
          page: () => const Product(),
          transition: Transition.zoom,
          transitionDuration: const Duration(milliseconds: 100),
        ),
        GetPage(
          name: '/pin',
          page: () => const PinView(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
