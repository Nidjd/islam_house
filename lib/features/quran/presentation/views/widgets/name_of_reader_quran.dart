import 'package:flutter/material.dart';

class NameOfReaderQuran extends StatelessWidget {
  const NameOfReaderQuran({
    super.key,
    required this.nameAuthor,
  });

  final String nameAuthor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        nameAuthor,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 16,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
