import 'package:flutter/material.dart';
import 'package:islam_house/features/quran/data/models/quran/attachment.dart';
import 'package:islam_house/features/quran/presentation/views/widgets/audio_payer_screen.dart';
import 'package:islam_house/features/quran/presentation/views/widgets/final_item.dart';



class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List<Attachment>;

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (data[index].extensionType == "MP3") {
              return FinalItem(
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
