import 'package:flutter/material.dart';

class FinalArticleItem extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const FinalArticleItem({
    super.key,
    required this.label, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(
            10,
          ),
          width: MediaQuery.of(context).size.width * 0.96,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.picture_as_pdf_rounded,
                color: Colors.red[900],
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
