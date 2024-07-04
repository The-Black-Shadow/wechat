import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wechat/components/button.dart';
import 'package:wechat/components/text_field.dart';

class SignupPage extends StatefulWidget {
  final Function()? ontap;
  const SignupPage({super.key, required this.ontap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
    //make sure password is match
    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      displayMessage('Password don\'t match');
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                  const Text('Let\'s create an account for you !'),
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
                  const SizedBox(height: 20),
                  //confirm password
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    isObsecure: true,
                  ),
                  //signin button
                  const SizedBox(height: 20),
                  MyButton(onTap: signUp, text: 'Sign Up'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already created an account ?'),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.ontap,
                        child: const Text(
                          'Login Now !',
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
      ),
    );
  }
}
