import 'package:firas_project/core/common/keys.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Provider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://esb.telin.tw';

    httpClient.addRequestModifier((Request request) {
      request.headers['apikey'] = Keys.apiKey;
      request.headers['b2bkey'] = Keys.b2bkey;
      return request;
    });
  }

  void declareDefaultDecoder(decoder) {
    httpClient.defaultDecoder = decoder;
  }

  // balance request
  Future<Response> getBalance() => get('/fascon-b2b/balance');

  // product request
  Future<Response> getProducts() => get('/fascon-b2b/product');
}
