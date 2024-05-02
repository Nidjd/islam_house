import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islam_house/core/utils/custom_progress_indicator.dart';
import 'package:video_player/video_player.dart';

class ShowVideo extends StatefulWidget {
  final String linkVideo;
  const ShowVideo({
    super.key,
    required this.linkVideo,
  });

  @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    initVideoController();
    super.initState();
  }

  void initVideoController() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.linkVideo))
      ..initialize().then((value) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _controller.value.isInitialized
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: AspectRatio(
                          aspectRatio: 1 / 2,
                          child: VideoPlayer(
                            _controller,
                          ),
                        ),
                      ),
                    ],
                  )
                : const CustomProgreesIndicator(),
            const SizedBox(
              height: 15,
            ),
            _controller.value.isInitialized
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(14)),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await _controller.play();
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await _controller.pause();
                            },
                            icon: const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: _controller,
                            builder: (context, VideoPlayerValue value, child) {
                              //Do Something with the value.
                              return Text(
                                value.position.toString().substring(0, 7),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
