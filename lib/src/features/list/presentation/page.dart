import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:intl/intl.dart';

import '../../../../generated/l10n.dart';
import '../../../shared/http/http_client.dart' hide ModularWatchExtension;
import '../../../shared/utils/loading.dart';
import '../../../shared/utils/navigation.dart';
import '../../../shared/utils/preferences.dart';
import '../../../shared/utils/utils_globals.dart';
import '../data/models/errors_model.dart';
import '../domain/usecases/get_list_errors_usecase.dart';
import 'bloc/bloc.dart';

part 'package:crash_inspector/src/features/list/presentation/_sections/body.dart';
part 'package:crash_inspector/src/features/list/presentation/_sections/error_item.dart';

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GetListErrorsUseCase getListErrorsUseCase =
        Modular.get<GetListErrorsUseCase>();

    return BlocProvider<BlocList>(
      create: (BuildContext context) => BlocList(
        getListErrorsUseCase: getListErrorsUseCase,
      )..add(const GetListErrorsEvent()),
      child: const BlocListener<BlocList, ListState>(
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
