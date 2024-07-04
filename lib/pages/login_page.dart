import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wechat/components/button.dart';
import 'package:wechat/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signin() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String e) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(e),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                //logo
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock_clock,
                  size: 100,
                ),
                const SizedBox(height: 30),
                //welcome screen
                const Text('Welcome You have been missed !'),
                const SizedBox(height: 50),

                //email
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  isObsecure: false,
                ),
                const SizedBox(height: 20),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  isObsecure: true,
                ),
                //signin button
                const SizedBox(height: 20),
                MyButton(onTap: signin, text: 'Sign In'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member ?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Regester Now !',
                        style: TextStyle(color: Colors.cyan),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
