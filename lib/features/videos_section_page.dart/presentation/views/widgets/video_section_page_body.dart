import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/constants.dart';
import 'package:islam_house/core/theming/styles.dart';
import 'package:islam_house/core/utils/custom_error_message.dart';
import 'package:islam_house/core/utils/custom_progress_indicator.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/manager/get_videos/get_videos_cubit.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/video_item.dart';

class VideoSectionPageBody extends StatefulWidget {
  const VideoSectionPageBody({
    super.key,
  });

  @override
  State<VideoSectionPageBody> createState() => _VideoSectionPageBodyState();
}

class _VideoSectionPageBodyState extends State<VideoSectionPageBody> {
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetVideosCubit, GetVideosState>(
          builder: (context, state) {
            if (state is GetVideosSuccessState) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => VideoItem(
                    title: state.video[index].title ?? '',
                    description: state.video[index].description ?? '',
                    nameAuthor: state.video[index].preparedBy!.isEmpty
                        ? ''
                        : state.video[index].preparedBy![0].title!,
                    numberOfVideos: state.video[index].attachments!.length,
                  ),
                  itemCount: state.video.length,
                ),
              );
            } else if (state is GetVideosFailureState) {
              return CustomErrorMessage(message: state.failure.eerMessage);
            } else {
              return const Expanded(child: CustomProgreesIndicator());
            }
          },
        ),
        Container(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetVideosCubit>(context)
                      .getVideosData(pageNumber: '1');
                  setState(() {});
                  currentNumber = 1;
                },
                child: Text('first', style: Styles.font16BlueBold),
              ),
              TextButton(
                onPressed: () async {
                  if (currentNumber > 1) {
                    currentNumber--;
                    setState(() {});
                    await BlocProvider.of<GetVideosCubit>(context)
                        .getVideosData(pageNumber: currentNumber.toString());
                  }
                },
                child: Text(
                  'prev',
                  style: Styles.font16BlueBold.copyWith(
                    color: currentNumber == 1 ? Colors.grey : Colors.blue[900],
                  ),
                ),
              ),
              // Text(
              //   'page : $currentPage',
              //   style: TextStyle(
              //       color: Colors.grey[900], fontWeight: FontWeight.bold),
              // ),
              TextButton(
                onPressed: () async {
                  if (currentNumber < pageNumbers!) {
                    currentNumber++;
                    setState(() {});
                    await BlocProvider.of<GetVideosCubit>(context)
                        .getVideosData(pageNumber: currentNumber.toString());
                  }
                },
                child: Text('next',
                    style: Styles.font16BlueBold.copyWith(
                      color: currentNumber == pageNumbers
                          ? Colors.grey
                          : Colors.blue[900],
                    )),
              ),
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetVideosCubit>(context)
                      .getVideosData(pageNumber: pageNumbers.toString());
                  setState(() {
                    currentNumber = pageNumbers!;
                  });
                },
                child: Text('last', style: Styles.font16BlueBold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
