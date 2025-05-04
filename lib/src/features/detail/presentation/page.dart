import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../shared/utils/loading.dart';
import '../../list/data/models/errors_model.dart';
import 'bloc/bloc.dart';

part 'package:crash_inspector/src/features/detail/presentation/_sections/error_detail.dart';

class Page extends StatelessWidget {
  const Page({
    required this.error,
    super.key,
  });

  final ErrorsModel error;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocDetail>(
      create: (BuildContext context) => BlocDetail(),
      child: BlocListener<BlocDetail, DetailState>(
        listener: _listener,
        child: ErrorDetail(
          error: error,
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, DetailState state) async {
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
