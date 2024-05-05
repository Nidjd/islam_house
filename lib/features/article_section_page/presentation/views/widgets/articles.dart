import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islam_house/core/helpers/extensions.dart';
import 'package:islam_house/core/routing/routes.dart';
import 'package:islam_house/features/article_section_page/data/models/article/attachment.dart';
import 'package:islam_house/features/article_section_page/presentation/views/widgets/final_article_item.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List<Attachment>;

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (data[index].extensionType == "PDF") {
              return FinalArticleItem(
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
