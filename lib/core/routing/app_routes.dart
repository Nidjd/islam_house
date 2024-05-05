import 'package:flutter/material.dart';
import 'package:islam_house/core/routing/routes.dart';
import 'package:islam_house/features/article_section_page/presentation/views/article_page.dart';
import 'package:islam_house/features/article_section_page/presentation/views/widgets/articles.dart';
import 'package:islam_house/features/books/presentation/views/book_page.dart';
import 'package:islam_house/features/books/presentation/views/widgets/books.dart';
import 'package:islam_house/features/home/presentation/views/home_page.dart';
import 'package:islam_house/features/khotab/presentation/views/khotba_page.dart';
import 'package:islam_house/features/khotab/presentation/views/widgets/Khotba.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/video_details_view.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/videos_section_page.dart';

class AppRoutes {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case Routes.videosSectionPage:
        return MaterialPageRoute(
          builder: (context) => const VideosSectionPage(),
        );
      case Routes.videoDetailsView:
        return MaterialPageRoute(
          builder: (context) => const VideoDetailsView(),
          settings: RouteSettings(arguments: settings.arguments),
        );
      case Routes.articlePage:
        return MaterialPageRoute(
          builder: (context) => const ArticlePage(),
          settings: RouteSettings(arguments: settings.arguments),
        );
      case Routes.articles:
        return MaterialPageRoute(
          builder: (context) => const Articles(),
          settings: RouteSettings(arguments: settings.arguments),
        );
        case Routes.booksPage:
        return MaterialPageRoute(
          builder: (context) => const BookPage(),
          settings: RouteSettings(arguments: settings.arguments),
        );
      case Routes.books:
        return MaterialPageRoute(
          builder: (context) => const Books(),
          settings: RouteSettings(arguments: settings.arguments),
        );
        case Routes.khotbaPage:
        return MaterialPageRoute(
          builder: (context) => const KhotabPage(),
          settings: RouteSettings(arguments: settings.arguments),
        );
      case Routes.khotba:
        return MaterialPageRoute(
          builder: (context) => const Khotba(),
          settings: RouteSettings(arguments: settings.arguments),
        );
      // case Routes.pdf:
      //   return MaterialPageRoute(
      //     builder: (context) => const Pdf(),
      //     settings: RouteSettings(arguments: settings.arguments),
      //   );
      // case Routes.showVideo:
      //   return MaterialPageRoute(
      //     builder: (context) => const ShowVideo(),
      //     settings: RouteSettings(arguments: settings.arguments),
      //   );

      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('not defined for ${settings.name}'),
          ),
        );
    }
  }
}
