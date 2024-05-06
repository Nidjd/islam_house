import 'package:flutter/material.dart';

import 'package:islam_house/features/audios/data/models/audios/attachment.dart';
import 'package:islam_house/features/audios/presentation/views/widgets/audio_payer_screen.dart';
import 'package:islam_house/features/audios/presentation/views/widgets/final_audio_item.dart';



class Audios extends StatefulWidget {
  const Audios({super.key});

  @override
  State<Audios> createState() => _AudiosState();
}

class _AudiosState extends State<Audios> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List<Attachment>;

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (data[index].extensionType == "MP3") {
              return FinalAudioItem(
                label: data[index].description ?? "",
                onTap: () async {
                  //  final Uri _url = Uri.parse(data[index].url!);
                  //  await launchUrl(_url);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AudioPlayerScreen(url: data[index].url!,),
                      ));
                },
              );
            }
            return Container();
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
