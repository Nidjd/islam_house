import 'package:flutter/material.dart';
import 'package:islam_house/core/routing/routes.dart';
import 'package:islam_house/features/home/presentation/views/home_page.dart';
import 'package:islam_house/features/videos_section_page.dart/data/models/video_info/attachment.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/video_details_view.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/videos_section_page.dart';
import 'package:islam_house/features/videos_section_page.dart/presentation/views/widgets/show_video.dart';

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
