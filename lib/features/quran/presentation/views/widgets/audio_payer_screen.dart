import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatefulWidget {
  final String url;
  const AudioPlayerScreen({super.key, required this.url});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    initAudio();
    super.initState();
  }
@override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }
  Duration position = Duration.zero;
  Duration _duration = Duration.zero;
  void initAudio() async {
    final duration = await player.setUrl(
      widget.url,
    );
    player.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });

    player.durationStream.listen((event) {
      setState(() {
        _duration = event!;
      });
    });
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}";
  }

  void handlePlayPause() async {
    if (player.playing) {
      await player.pause();
    } else {
      await player.play();
    }
  }

  void handleSeek(double d) {
    player.seek(Duration(seconds: d.toInt()));
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: handlePlayPause,
                  icon: Icon(
                    player.playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                Text(
                  formatDuration(position),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Slider(
                  min: 0.0,
                  max: _duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: handleSeek,
                ),
                Text(
                  formatDuration(
                    _duration,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
