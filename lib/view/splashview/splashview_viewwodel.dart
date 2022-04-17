import 'package:get/get.dart';

class SplashViewModel {
  Future<void> initializeSettings() async {
    // _authManager.checkLoginStatus();

    // simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 1));
  }
}
