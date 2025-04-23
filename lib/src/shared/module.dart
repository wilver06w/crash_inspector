import 'package:crash_inspector/src/features/home/presentation/page.dart'
    as home;
import 'package:crash_inspector/src/shared/http/http_client.dart';
import 'package:crash_inspector/src/features/add/presentation/page.dart' as add;
import 'package:crash_inspector/src/shared/utils/preferences.dart';

class GlobalModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<Preferences>(Preferences.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const home.Page(),
    );
    r.child(
      '/add/',
      child: (context) => const add.Page(),
    );
  }
}
