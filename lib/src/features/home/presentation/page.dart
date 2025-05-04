import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../shared/http/http_client.dart' hide ModularWatchExtension;
import '../../../shared/models/sentry_config.dart';
import '../../../shared/utils/loading.dart';
import '../../../shared/utils/navigation.dart';
import '../../../shared/utils/preferences.dart';
import '../../../shared/utils/utils_globals.dart';
import '../domain/models/sentry_config_model.dart';
import '../domain/usecases/get_sentry_configs_usecase.dart';
import '../domain/usecases/remove_sentry_config_usecase.dart';
import 'bloc/bloc.dart';

part 'package:crash_inspector/src/features/home/presentation/_sections/body.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final GetSentryConfigsUseCase getSentryConfigsUseCase =
        Modular.get<GetSentryConfigsUseCase>();
    final RemoveSentryConfigUseCase removeSentryConfigUseCase =
        Modular.get<RemoveSentryConfigUseCase>();

    return BlocProvider<BlocHome>(
      create: (BuildContext context) => BlocHome(
        getSentryConfigsUseCase: getSentryConfigsUseCase,
        removeSentryConfigUseCase: removeSentryConfigUseCase,
      )..add(const GetSentryConfigsEvent()),
      child: const BlocListener<BlocHome, HomeState>(
        listener: _listener,
        child: Body(),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, HomeState state) async {
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
    context.read<BlocHome>().add(const GetSentryConfigsEvent());
  }
}
