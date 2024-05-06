import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/constants.dart';


import 'package:islam_house/core/helpers/extensions.dart';
import 'package:islam_house/core/routing/routes.dart';
import 'package:islam_house/core/theming/styles.dart';
import 'package:islam_house/core/utils/custom_error_message.dart';
import 'package:islam_house/core/utils/custom_progress_indicator.dart';
import 'package:islam_house/features/audios/presentation/manager/cubit/get_audios_cubit.dart';
import 'package:islam_house/features/audios/presentation/views/widgets/book_item.dart';

class AudioPageBody extends StatefulWidget {
  const AudioPageBody({
    super.key,
  });

  @override
  State<AudioPageBody> createState() => _AudioPageBodyState();
}

class _AudioPageBodyState extends State<AudioPageBody> {
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetAudioCubit, GetAudiosState>(
          builder: (context, state) {
            if (state is GetAudiosSuccessState) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => AudioItem(
                    label: state.audios[index].title ?? '',
                    description: state.audios[index].description ?? '',
                    name: state.audios[index].preparedBy!.isEmpty
                        ? ''
                        : state.audios[index].preparedBy![0].title!,
                    countAudios:
                        state.audios[index].attachments?.length.toString() ??
                            '',
                    onTap: () {
                      context.pushNamed(Routes.audio, context,state.audios[index].attachments);
                    },
                  ),
                  itemCount: state.audios.length,
                ),
              );
            } else if (state is GetAudiosFailureState) {
              return CustomErrorMessage(message: state.errMessage);
            } else {
              return const Expanded(child: CustomProgreesIndicator());
            }
          },
        ),
        Container(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetAudioCubit>(context)
                      .getAudiosData(pageNumer: '0');
                  setState(() {});
                  currentNumber = 1;
                },
                child: Text('first', style: Styles.font16BlueBold),
              ),
              TextButton(
                onPressed: () async {
                  if (currentNumber > 1) {
                    currentNumber--;
                    setState(() {});
                    await BlocProvider.of<GetAudioCubit>(context)
                        .getAudiosData(pageNumer: currentNumber.toString());
                  }
                },
                child: Text(
                  'prev',
                  style: Styles.font16BlueBold.copyWith(
                    color: currentNumber == 1 ? Colors.grey : Colors.blue[900],
                  ),
                ),
              ),
              // Text(
              //   'page : $currentPage',
              //   style: TextStyle(
              //       color: Colors.grey[900], fontWeight: FontWeight.bold),
              // ),
              TextButton(
                onPressed: () async {
                  if (currentNumber < pageNumbersForAudios!) {
                    currentNumber++;
                    setState(() {});
                    await BlocProvider.of<GetAudioCubit>(context)
                        .getAudiosData(pageNumer: currentNumber.toString());
                  }
                },
                child: Text('next',
                    style: Styles.font16BlueBold.copyWith(
                      color: currentNumber == pageNumbersForAudios
                          ? Colors.grey
                          : Colors.blue[900],
                    )),
              ),
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetAudioCubit>(context)
                      .getAudiosData(
                          pageNumer: pageNumbersForAudios.toString());
                  setState(() {
                    currentNumber = pageNumbersForAudios!;
                  });
                },
                child: Text('last', style: Styles.font16BlueBold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
