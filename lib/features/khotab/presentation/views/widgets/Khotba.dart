import 'package:flutter/material.dart';
import 'package:islam_house/features/khotab/data/models/khotba/attachment.dart';
import 'package:islam_house/features/khotab/presentation/views/widgets/final_khotba_item.dart';



import 'package:url_launcher/url_launcher.dart';

class Khotba extends StatefulWidget {
  const Khotba({super.key});

  @override
  State<Khotba> createState() => _KhotbaState();
}

class _KhotbaState extends State<Khotba> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List<Attachment>;

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (data[index].extensionType == "PDF") {
              return FinalKhitbaItem(
                label: data[index].description ?? "",
                onTap: () async {
                  final Uri _url = Uri.parse(data[index].url!);
                 await launchUrl(_url);
                  
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
