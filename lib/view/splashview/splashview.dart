import 'package:firas_project/view/onboard/onboardview.dart';
import 'package:firas_project/view/splashview/splashview_viewwodel.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_auth/logic/services/auth_manager.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  // final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  final _splash = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _splash.initializeSettings(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnboardView();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
      body: Center(
        child: Text('Error: ${snapshot.error}'),
      ),
    );
  }

  Scaffold waitingView() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
