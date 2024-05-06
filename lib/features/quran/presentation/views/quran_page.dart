import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/core/utils/service_locator.dart';
import 'package:islam_house/features/quran/data/repos/audio_repo_impl.dart';
import 'package:islam_house/features/quran/presentation/manager/cubit/get_audios_cubit.dart';
import 'package:islam_house/features/quran/presentation/views/widgets/quran_page_body.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetQuranCubit(getIt.get<QuranRepoImpl>())..getQuranData(pageNumer: '0'),
        child: const QuranPageBody(),
      ),
    );
  }
}
