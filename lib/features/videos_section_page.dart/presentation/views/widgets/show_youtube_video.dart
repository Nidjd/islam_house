import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowYoutubeVideo extends StatefulWidget {
  final String linkVideo;
  const ShowYoutubeVideo({
    super.key,
    required this.linkVideo,
  });

  @override
  State<ShowYoutubeVideo> createState() => _ShowYoutubeVideoState();
}

class _ShowYoutubeVideoState extends State<ShowYoutubeVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        widget.linkVideo,
      )!,
    );
    super.initState();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: AspectRatio(
                      aspectRatio: 1 / 2,
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),
                        onReady: () {
                          _controller.addListener(
                            () {},
                          );
                        },
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
