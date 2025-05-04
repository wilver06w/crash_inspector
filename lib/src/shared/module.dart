import 'package:flutter/material.dart';

import '../features/add/presentation/page.dart' as add;
import '../features/detail/presentation/page.dart' as detail;
import '../features/home/inject.dart';
import '../features/home/presentation/page.dart' as home;
import '../features/list/data/models/errors_model.dart';
import '../features/list/inject.dart';
import '../features/list/presentation/page.dart' as list;
import 'http/http_client.dart';
import 'utils/preferences.dart';

class GlobalModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HttpClient>(HttpClient.new);
    i.addSingleton<Preferences>(Preferences.new);

    InjectHome.binds(i);
    InjectList.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (BuildContext context) => const home.Page(),
    );
    r.child(
      '/add',
      child: (BuildContext context) => const add.Page(),
    );
    r.child(
      '/list_errors',
      child: (BuildContext context) => const list.Page(),
    );
    r.child(
      '/detail',
      child: (BuildContext context) {
        final Object? rawData = r.args.data;
        final Map<String, dynamic> data =
            (rawData as Map<String, dynamic>?) ?? <String, dynamic>{};
        final ErrorsModel error = data['error'] as ErrorsModel;

        return detail.Page(
          error: error,
        );
      },
    );
  }
}
