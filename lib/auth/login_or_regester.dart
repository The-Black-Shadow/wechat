import 'package:flutter/material.dart';
import 'package:wechat/pages/login_page.dart';
import 'package:wechat/pages/signup_page.dart';

class LoginOrRegester extends StatefulWidget {
  const LoginOrRegester({super.key});

  @override
  State<LoginOrRegester> createState() => _LoginOrRegesterState();
}

class _LoginOrRegesterState extends State<LoginOrRegester> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return SignupPage(ontap: togglePages);
    }
  }
}
