import 'package:firas_project/core/controllers/products.dart';
import 'package:firas_project/misc/app_colors.dart';
import 'package:firas_project/misc/widgets/app_text.dart';
import 'package:firas_project/view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: AppText(
            text: 'Produk Indonesia',
            weight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: controller.obx(
            (products) => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
              ),
              itemCount: products!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    var productName = products[index].name!;
                    Get.toNamed('/product?title=$productName');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryAppColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: AppText(
                            text: products[index].abbreviation as String,
                            color: Colors.white,
                            weight: FontWeight.w700,
                            size: 22,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: AppText(
                          text: products[index].name as String,
                          color: AppColors.secondaryAppColor,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            onLoading: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return skeletonTheme(
                  SkeletonItem(
                    child: Column(
                      children: [
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.circle, width: 50, height: 50),
                        ),
                        const SizedBox(height: 8),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                            // randomLength: true,
                            height: 14,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            onError: (error) => Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: AppText(
                      text:
                          'Error: Something went wrong! Check if you\'re connected.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AppButton(
                    'Try again',
                    func: () {
                      controller.fetchAllProducts();
                    },
                    comparison: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget skeletonTheme(ch) => SkeletonTheme(
      themeMode: ThemeMode.light,
      shimmerGradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 199, 192, 192),
          Color.fromARGB(255, 107, 102, 102),
          Color.fromARGB(255, 154, 146, 146),
          Color.fromARGB(255, 107, 102, 102),
          Color.fromARGB(255, 199, 192, 192),
        ],
        stops: [
          0.1,
          0.5,
          0.9,
          0.5,
          0.1,
        ],
      ),
      child: ch);
}
