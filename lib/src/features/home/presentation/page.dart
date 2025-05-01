import 'package:crash_inspector/generated/l10n.dart';
import 'package:crash_inspector/src/features/home/domain/usecases/get_sentry_configs_usecase.dart';
import 'package:crash_inspector/src/features/home/domain/usecases/remove_sentry_config_usecase.dart';
import 'package:crash_inspector/src/features/home/presentation/bloc/bloc.dart';
import 'package:crash_inspector/src/shared/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:crash_inspector/src/shared/utils/loading.dart';
import 'package:crash_inspector/src/shared/utils/navigation.dart';
import 'package:crash_inspector/src/shared/utils/utils_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

part 'package:crash_inspector/src/features/home/presentation/_sections/body.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final getSentryConfigsUseCase = Modular.get<GetSentryConfigsUseCase>();
    final removeSentryConfigUseCase = Modular.get<RemoveSentryConfigUseCase>();

    return BlocProvider(
      create: (context) => BlocHome(
        getSentryConfigsUseCase: getSentryConfigsUseCase,
        removeSentryConfigUseCase: removeSentryConfigUseCase,
      )..add(const GetSentryConfigsEvent()),
      child: BlocListener<BlocHome, HomeState>(
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
