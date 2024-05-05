import 'package:flutter/material.dart';
import 'package:islam_house/features/books/data/models/books/attachment.dart';
import 'package:islam_house/features/books/presentation/views/widgets/final_book_item.dart';



import 'package:url_launcher/url_launcher.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List<Attachment>;

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (data[index].extensionType == "PDF") {
              return FinalBookItem(
                label: data[index].description ?? "",
                onTap: () async {
                  final Uri _url = Uri.parse(data[index].url!);
                 await launchUrl(_url);
                  //  context.pushNamed(Routes.pdf, context,data[index].url);
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
