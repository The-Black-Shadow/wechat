// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:wechat/components/like_button.dart';

class WallPost extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;
  const WallPost({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
  });

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    //access from firebase
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email]),
      });
    } else if (!isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email]),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Row(
        children: [
          //profile pic
          Column(
            children: [
              //like button
              LikeButton(isLiked: isLiked, onTap: toggleLike),
              //like count
              Text(widget.likes.length.toString()),
            ],
          ),
          const SizedBox(width: 10),
          //message
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.message),
              const SizedBox(height: 10),
              Text(
                widget.user,
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
