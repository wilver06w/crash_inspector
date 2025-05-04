// import 'package:crash_inspector/src/shared/http/http_client.dart'
//     hide ModularWatchExtension;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../shared/http/http_client.dart' hide ModularWatchExtension;
import '../../../shared/models/sentry_config.dart';
import '../../../shared/utils/preferences.dart';
import 'bloc/bloc.dart';

part 'package:crash_inspector/src/features/add/presentation/_sections/add_view.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddBloc>(
      create: (BuildContext context) => AddBloc(),
      child: const BlocListener<AddBloc, AddState>(
        listener: _listener,
        child: AddView(),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, AddState state) async {
  // if (state is LoadingGetOrderState) {
  //   AppLoading.show(context);
  // } else if (state is ErrorGetOrderState) {
  //   Navigator.pop(context);
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(state.message),
  //       backgroundColor: Colors.red,
  //     ),
  //   );
  // } else if (state is LoadedGetOrderState) {
  //   Navigator.pop(context);
  // }
}
