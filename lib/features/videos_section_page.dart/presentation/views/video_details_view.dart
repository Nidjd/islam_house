import 'package:flutter/material.dart';
import 'package:islam_house/features/videos_section_page.dart/data/models/video_info/attachment.dart';

import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/video_with_label.dart';

class VideoDetailsView extends StatelessWidget {
  const VideoDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List<Attachment>;
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) =>  Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            child: VideoWithLabel(data: data[index],),
          ),
          itemCount: data.length,
        ),
      ),
    );
  }
}
