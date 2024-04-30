
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:islam_house/core/utils/service_locator.dart';
import 'package:islam_house/features/videos_section_page.dart/data/repos/video_section_repo_impl.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/manager/get_videos/get_videos_cubit.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/video_section_page_body.dart';

class VideosSectionPage extends StatelessWidget {
  const VideosSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => GetVideosCubit(getIt.get<VideoSectionRepoImpl>())..getVideosData(pageNumber: '1'),
        child: const VideoSectionPageBody(),
      ),
    );
  }
}
