import 'package:flutter/material.dart';

class TitleOfQuran extends StatelessWidget {
  const TitleOfQuran({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        title,
        maxLines: 1,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
            color: Colors.red[900]),
      ),
    );
  }
}
