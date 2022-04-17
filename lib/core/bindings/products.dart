import 'package:firas_project/core/controllers/balance.dart';
import 'package:firas_project/core/controllers/products.dart';
import 'package:firas_project/core/providers/provider.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Provider());
    Get.lazyPut(() => ProductController(provider: Get.find()));
    Get.lazyPut(() => BalanceConroller(provider: Get.find()));
  }
}
