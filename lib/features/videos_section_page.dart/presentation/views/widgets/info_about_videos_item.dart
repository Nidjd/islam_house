import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islam_house/core/theming/colors.dart';
import 'package:islam_house/core/utils/assets.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/description_of_video.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/name_of_author_video.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/title_of_video.dart';

class InfoAboutVideosItem extends StatelessWidget {
  final String title;
  final String description;
  final String nameAuthor;
  final int numberOfVideos;
  final void Function() onTap;
  const InfoAboutVideosItem({
    super.key,
    required this.title,
    required this.description,
    required this.nameAuthor,
    required this.numberOfVideos,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 130,
          decoration: BoxDecoration(
            color: ColorManager.cardVideosBackgroundColor,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      12,
                    ),
                    topLeft: Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TitleOfVideo(title: title),
                      DescriptionOfVideo(description: description),
                      NameOfAuthorVideo(nameAuthor: nameAuthor),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsData.videoImageIcon,
                      height: 50,
                    ),
                    Text(
                      numberOfVideos.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
