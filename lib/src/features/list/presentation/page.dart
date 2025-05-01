import 'package:crash_inspector/src/features/list/domain/usecases/get_list_errors_usecase.dart';
import 'package:crash_inspector/src/features/list/presentation/bloc/bloc.dart';
import 'package:crash_inspector/src/shared/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:crash_inspector/src/shared/utils/loading.dart';
import 'package:crash_inspector/src/shared/utils/navigation.dart';
import 'package:crash_inspector/src/shared/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

part 'package:crash_inspector/src/features/list/presentation/_sections/body.dart';

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final getListErrorsUseCase = Modular.get<GetListErrorsUseCase>();

    return BlocProvider(
      create: (context) => BlocList(
        getListErrorsUseCase: getListErrorsUseCase,
      )..add(const GetListErrorsEvent()),
      child: BlocListener<BlocList, ListState>(
        listener: _listener,
        child: Body(),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, ListState state) async {
  if (state is LoadingGetSentryConfigsState) {
    AppLoading.show(context);
  } else if (state is ErrorGetSentryConfigsState) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
        backgroundColor: Colors.red,
      ),
    );
  } else if (state is LoadedGetSentryConfigsState) {
    Navigator.pop(context);
  }
}
