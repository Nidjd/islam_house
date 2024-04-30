import 'package:flutter/material.dart';

import 'package:islam_house/core/utils/service_locator.dart';
import 'package:islam_house/features/home/data/repos/home_repo_impl.dart';
import 'package:islam_house/features/home/presentation/manager/get_site_content/get_site_content_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/features/home/presentation/views/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            GetSiteContentCubit(getIt.get<HomeRepoImpl>())..getSiteContent(),
        child: const HomePageBody(),
      ),
    );
  }
}
