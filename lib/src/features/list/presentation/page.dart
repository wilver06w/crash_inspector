import 'package:crash_inspector/generated/l10n.dart';
import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';

import 'package:crash_inspector/src/features/list/domain/usecases/get_list_errors_usecase.dart';
import 'package:crash_inspector/src/features/list/domain/usecases/remove_list_errors_usecase.dart';
import 'package:crash_inspector/src/features/list/presentation/bloc/bloc.dart';
import 'package:crash_inspector/src/shared/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:crash_inspector/src/shared/utils/loading.dart';
import 'package:crash_inspector/src/shared/utils/navigation.dart';
import 'package:crash_inspector/src/shared/utils/preferences.dart';
import 'package:crash_inspector/src/shared/utils/utils_globals.dart';
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
    final removeListErrorsUseCase = Modular.get<RemoveListErrorsUseCase>();

    return BlocProvider(
      create: (context) => BlocList(
        getListErrorsUseCase: getListErrorsUseCase,
        removeListErrorsUseCase: removeListErrorsUseCase,
      )..add(const GetSentryConfigsEvent()),
      child: BlocListener<BlocList, ListState>(
        listener: _listener,
        child: Body(),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, ListState state) async {
  if (state is LoadingGetSentryConfigsState ||
      state is LoadingRemoveSentryConfigState) {
    AppLoading.show(context);
  } else if (state is ErrorGetSentryConfigsState) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
        backgroundColor: Colors.red,
      ),
    );
  } else if (state is ErrorRemoveSentryConfigState) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
        backgroundColor: Colors.red,
      ),
    );
  } else if (state is LoadedGetSentryConfigsState) {
    Navigator.pop(context);
  } else if (state is LoadedRemoveSentryConfigState) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${S.current.sentryConfigRemoved} ${state.sentryConfigModel.organizationId}',
        ),
        backgroundColor: Colors.green,
      ),
    );
    context.read<BlocList>().add(const GetSentryConfigsEvent());
  }
}
