import 'package:flutter/material.dart';

import 'package:islam_house/features/videos_section_page.dart/data/models/video_info/attachment.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/show_video.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/show_youtube_video.dart';

class VideoWithLabel extends StatelessWidget {
  const VideoWithLabel({
    super.key,
    required this.data,
  });
  final Attachment data;

  bool isYouTubeLink(String link) {
    final RegExp youtubePattern = RegExp(
        r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$');
    return youtubePattern.hasMatch(link);
  }

  @override
  Widget build(BuildContext context) {
    final videCardWidth = MediaQuery.of(context).size.width * 0.5;
    final videoCardHeight = MediaQuery.of(context).size.height * (1 / 5);
    return GestureDetector(
      onTap: () {
        if (isYouTubeLink(data.url!)) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowYoutubeVideo(linkVideo: data.url!),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowVideo(
                linkVideo: data.url!,
              ),
            ),
          );
        }
      },
      child: Container(
        width: videCardWidth,
        height: videoCardHeight,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(
                child: Icon(
                  Icons.play_circle_rounded,
                  size: 55,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.description ?? 'لا يوجد عنوان',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
