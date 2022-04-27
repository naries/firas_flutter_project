import 'package:get/get.dart';

class HistoryController extends GetxController {
  var value = "January".obs;

  updateValue(newValue) => value.value = newValue;
}
