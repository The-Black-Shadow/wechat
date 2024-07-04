import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wechat/components/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void postMessage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Wechat',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: signOut,
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: textController,
                      hintText: 'Write something on the wall !',
                      isObsecure: false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(Icons.arrow_circle_up_outlined),
                  ),
                ],
              ),
            ),
            Text('Logged in as ${currentUser.email!}'),
          ],
        ),
      ),
    );
  }
}
