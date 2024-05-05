import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/constants.dart';


import 'package:islam_house/core/helpers/extensions.dart';
import 'package:islam_house/core/routing/routes.dart';

import 'package:islam_house/core/theming/styles.dart';
import 'package:islam_house/core/utils/custom_error_message.dart';
import 'package:islam_house/core/utils/custom_progress_indicator.dart';
import 'package:islam_house/features/khotab/presentation/manager/cubit/get_khotab_cubit.dart';
import 'package:islam_house/features/khotab/presentation/views/widgets/khotba_item.dart';

class KhotbaPageBody extends StatefulWidget {
  const KhotbaPageBody({
    super.key,
  });

  @override
  State<KhotbaPageBody> createState() => _KhotbaPageBodyState();
}

class _KhotbaPageBodyState extends State<KhotbaPageBody> {
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetKhotabCubit, GetKhotabState>(
          builder: (context, state) {
            if (state is GetKhotabSuccessState) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => KhotbaItem(
                    label: state.khotab[index].title ?? '',
                    description: state.khotab[index].description ?? '',
                    name: state.khotab[index].preparedBy!.isEmpty
                        ? ''
                        : state.khotab[index].preparedBy![0].title!,
                    countKhotba:
                        state.khotab[index].attachments?.length.toString() ??
                            '',
                    onTap: () {
                      context.pushNamed(Routes.books, context,state.khotab[index].attachments);
                    },
                  ),
                  itemCount: state.khotab.length,
                ),
              );
            } else if (state is GetKhotabFailureState) {
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
                  await BlocProvider.of<GetKhotabCubit>(context)
                      .getKhotabData(pageNumer: '0');
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
                    await BlocProvider.of<GetKhotabCubit>(context)
                        .getKhotabData(pageNumer: currentNumber.toString());
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
                  if (currentNumber < pageNumbersForKhotab!) {
                    currentNumber++;
                    setState(() {});
                    await BlocProvider.of<GetKhotabCubit>(context)
                        .getKhotabData(pageNumer: currentNumber.toString());
                  }
                },
                child: Text('next',
                    style: Styles.font16BlueBold.copyWith(
                      color: currentNumber == pageNumbersForKhotab
                          ? Colors.grey
                          : Colors.blue[900],
                    )),
              ),
              TextButton(
                onPressed: () async {
                  await BlocProvider.of<GetKhotabCubit>(context)
                      .getKhotabData(
                          pageNumer: pageNumbersForKhotab.toString());
                  setState(() {
                    currentNumber = pageNumbersForKhotab!;
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
