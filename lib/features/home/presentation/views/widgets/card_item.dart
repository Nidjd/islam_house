import 'package:flutter/material.dart';
import 'package:islam_house/core/theming/colors.dart';
import 'package:islam_house/core/theming/styles.dart';

class CardItem extends StatelessWidget {
  final String label;
  final int itemCount;
  final void Function() onTap;
  const CardItem({
    super.key,
    required this.label,
    required this.onTap,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width * 0.5;
    final cardHeight = MediaQuery.of(context).size.height * (1 / 5);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: ColorManager.cardBackgroundColor,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label,
                style: Styles.font23White500Weight,
              ),
              Text(
                "عدد العناصر : $itemCount",
                style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
