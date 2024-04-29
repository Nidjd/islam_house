import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:islam_house/core/utils/custom_error_message.dart';
import 'package:islam_house/core/utils/custom_progress_indicator.dart';
import 'package:islam_house/features/home/presentation/manager/get_site_content/get_site_content_cubit.dart';
import 'package:islam_house/features/home/presentation/views/widgets/card_item.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GetSiteContentCubit, GetSiteContentState>(
        builder: (context, state) {
          if (state is GetSiteContentSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemBuilder: (context, index) => CardItem(
                        label:
                            state.siteContentList[index].blockName.toString(),
                        onTap: () {},
                        itemCount: state.siteContentList[index].itemsCount!,
                      ),
                      itemCount: state.siteContentList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (state is GetSiteContentFailureState) {
            return CustomErrorMessage(message: state.failure.eerMessage);
          } else {
            return const CustomProgreesIndicator();
          }
        },
      ),
    );
  }
}
