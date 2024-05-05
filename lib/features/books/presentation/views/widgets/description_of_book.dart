import 'package:flutter/material.dart';

class DescriptionOfBook extends StatelessWidget {
  const DescriptionOfBook({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        description,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 17,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800]),
        maxLines: 2,
      ),
    );
  }
}
