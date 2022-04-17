import 'package:firas_project/core/models/balance_model.dart';
import 'package:firas_project/core/providers/provider.dart';
import 'package:get/get.dart';

class BalanceConroller extends GetxController with StateMixin<BalanceModel> {
  final Provider provider;
  BalanceConroller({required this.provider});

  @override
  void onInit() {
    super.onInit();
    fetchBalance();
  }

  void fetchBalance() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await provider.getBalance();
      BalanceModel? data = BalanceModel.iFromJson(response.body);
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
