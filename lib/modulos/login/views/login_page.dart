// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: controller.loginController,
              decoration: const InputDecoration(labelText: 'Login'),
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            RaisedButton(
              onPressed: () => controller.logar(),
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
