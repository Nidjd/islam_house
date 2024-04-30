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
                correctLabel(label),
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

String correctLabel(String label) {
  if (label == 'showall') {
    return 'إظهار الكل';
  } else if (label == 'videos') {
    return 'فيديوهات';
  } else if (label == 'books') {
    return 'كتب';
  } else if (label == 'articles') {
    return 'مقالات';
  } else if (label == 'audios') {
    return 'صوتيات';
  } else if (label == 'fatwa') {
    return 'فتوى';
  } else if (label == 'favorites') {
    return 'المفضلة';
  } else if (label == 'quran') {
    return 'القرآن';
  } else if (label == 'cards') {
    return 'بطاقات';
  } else if (label == 'news') {
    return 'الأخبار';
  } else if (label == 'poster') {
    return 'الملصقات';
  } else if (label == 'apps') {
    return 'التطبيقات';
  } else if (label == 'khotab') {
    return 'الخطب';
  } else {
    return label;
  }
}
