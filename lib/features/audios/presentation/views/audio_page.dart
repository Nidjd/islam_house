import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/core/utils/service_locator.dart';
import 'package:islam_house/features/audios/data/repos/audio_repo_impl.dart';
import 'package:islam_house/features/audios/presentation/manager/cubit/get_audios_cubit.dart';
import 'package:islam_house/features/audios/presentation/views/widgets/audio_page_body.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetAudioCubit(getIt.get<AudioRepoImpl>())..getAudiosData(pageNumer: '0'),
        child: const AudioPageBody(),
      ),
    );
  }
}
