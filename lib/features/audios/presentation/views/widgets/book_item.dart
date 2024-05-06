import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islam_house/core/utils/assets.dart';
import 'package:islam_house/features/audios/presentation/views/widgets/description_of_audio.dart';
import 'package:islam_house/features/audios/presentation/views/widgets/name_of_author_audio.dart';
import 'package:islam_house/features/audios/presentation/views/widgets/title_of_audio.dart';

class AudioItem extends StatelessWidget {
  final String label;
  final String description;
  final String name;
  final String countAudios;
  final void Function() onTap;
  const AudioItem({
    super.key,
    required this.label,
    required this.description,
    required this.name,
    required this.countAudios, required this.onTap,
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
            color: Colors.green[500],
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
                      TitleOfAudio(title: label),
                      DescriptionOfAudio(description: description),
                      NameOfAutorAudio(nameAuthor: name),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsData.articleIcon,
                      height: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      countAudios,
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
