import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/core/helpers/extensions.dart';
import 'package:islam_house/core/routing/routes.dart';

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
                      itemBuilder: (context, index) {
                        
                        return CardItem(
                          label:
                              state.siteContentList[index].blockName.toString(),
                          onTap: () {
                            if (state.siteContentList[index].blockName
                                    .toString() ==
                                'videos') {
                              context.pushNamed(
                                  Routes.videosSectionPage, context);
                            } else if (state.siteContentList[index].blockName
                                    .toString() ==
                                'articles') {
                              context.pushNamed(Routes.articlePage, context);
                            } else if (state.siteContentList[index].blockName
                                    .toString() ==
                                'books') {
                              context.pushNamed(Routes.booksPage, context);
                            }else if (state.siteContentList[index].blockName
                                    .toString() ==
                                'khotab') {
                              context.pushNamed(Routes.khotbaPage, context);
                            }
                          },
                          itemCount: state.siteContentList[index].itemsCount!,
                        );
                      },
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
