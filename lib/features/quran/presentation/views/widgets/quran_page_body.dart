import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/constants.dart';


import 'package:islam_house/core/helpers/extensions.dart';
import 'package:islam_house/core/routing/routes.dart';
import 'package:islam_house/core/theming/styles.dart';
import 'package:islam_house/core/utils/custom_error_message.dart';
import 'package:islam_house/core/utils/custom_progress_indicator.dart';
import 'package:islam_house/features/quran/presentation/manager/cubit/get_audios_cubit.dart';
import 'package:islam_house/features/quran/presentation/views/widgets/quran_item.dart';

class QuranPageBody extends StatefulWidget {
  const QuranPageBody({
    super.key,
  });

  @override
  State<QuranPageBody> createState() => _QuranPageBodyState();
}

class _QuranPageBodyState extends State<QuranPageBody> {
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetQuranCubit, GetQuranState>(
          builder: (context, state) {
            if (state is GetQuranSuccessState) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => QuranItem(
                    label: state.quran[index].title ?? '',
                    description: state.quran[index].description ?? '',
                    name: state.quran[index].preparedBy!.isEmpty
                        ? ''
                        : state.quran[index].preparedBy![0].title!,
                    countAudios:
                        state.quran[index].attachments?.length.toString() ??
                            '',
                    onTap: () {
                      context.pushNamed(Routes.audio, context,state.quran[index].attachments);
                    },
                  ),
                  itemCount: state.quran.length,
                ),
              );
            } else if (state is GetQuranFailureState) {
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
                  await BlocProvider.of<GetQuranCubit>(context)
                      .getQuranData(pageNumer: '0');
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
                    await BlocProvider.of<GetQuranCubit>(context)
                        .getQuranData(pageNumer: currentNumber.toString());
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
                  if (currentNumber < pageNumbersForQuran!) {
                    currentNumber++;
                    setState(() {});
                    await BlocProvider.of<GetQuranCubit>(context)
                        .getQuranData(pageNumer: currentNumber.toString());
                  }
                },
                child: Text('next',
                    style: Styles.font16BlueBold.copyWith(
                      color: currentNumber == pageNumbersForQuran
                          ? Colors.grey
                          : Colors.blue[900],
                    )),
              ),
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetQuranCubit>(context)
                      .getQuranData(
                          pageNumer: pageNumbersForQuran.toString());
                  setState(() {
                    currentNumber = pageNumbersForQuran!;
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
