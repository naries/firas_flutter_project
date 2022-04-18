import 'package:firas_project/misc/widgets/app_text.dart';
import 'package:firas_project/view/widgets/button.dart';
import 'package:firas_project/view/widgets/tob_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    var title = Get.parameters['title'] ?? "Product name";

    var choice = 'pulsa'.obs;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              title: title,
            ),
            Card(
              margin: const EdgeInsets.all(15),
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: 'Nomor Telepon',
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(15.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      'Pulsa',
                      func: () {
                        choice.value = "pulsa";
                      },
                      comparison: choice.value == 'pulsa',
                    ),
                    AppButton(
                      'Internet',
                      func: () {
                        choice.value = "internet";
                      },
                      comparison: choice.value == 'internet',
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              'PURCHASE',
              func: () {
                Get.toNamed('pin');
              },
              comparison: true,
              width: Get.width - 30,
            ),
          ],
        ),
      ),
    );
  }
}
