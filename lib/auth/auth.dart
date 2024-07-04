import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wechat/auth/login_or_regester.dart';
import 'package:wechat/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshots) {
        if (snapshots.hasData) {
          return const HomePage();
        } else {
          return const LoginOrRegester();
        }
      },
    );
  }
}
