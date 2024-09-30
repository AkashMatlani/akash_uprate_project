import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(250, 250, 250, 1)),
      child: Center(
        child: Image.asset(
          "assets/images/Comment.png",
          color: const Color.fromRGBO(229, 229, 230, 1),
          height: 45,
          width: 45,
        ),
      ),
    );
  }
}
