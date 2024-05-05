import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_house/core/utils/service_locator.dart';
import 'package:islam_house/features/khotab/data/repos/khotba_repo_impl.dart';
import 'package:islam_house/features/khotab/presentation/manager/cubit/get_khotab_cubit.dart';
import 'package:islam_house/features/khotab/presentation/views/widgets/khotba_page_body.dart';

class KhotabPage extends StatelessWidget {
  const KhotabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetKhotabCubit(getIt.get<KhotbaRepoImpl>())..getKhotabData(pageNumer: '0'),
        child: const KhotbaPageBody(),
      ),
    );
  }
}
