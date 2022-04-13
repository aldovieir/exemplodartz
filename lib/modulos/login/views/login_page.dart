// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    // EdgeAlert.show(
    //   context,
    //   title: 'Erro',
    //   description: message,
    //   gravity: EdgeAlert.TOP,
    //   duration: EdgeAlert.LENGTH_SHORT,
    //   backgroundColor: Colors.red,
    //   icon: Icons.error
    // );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
