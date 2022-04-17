import 'package:firas_project/core/models/products_model.dart';
import 'package:firas_project/core/providers/provider.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductModel>> {
  final Provider provider;
  ProductController({required this.provider});

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await provider.getProducts();
      List<ProductModel>? data = ProductModel.listFromJson(response.body);
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
