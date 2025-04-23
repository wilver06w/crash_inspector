import 'package:crash_inspector/src/features/home/presentation/page.dart'
    as home;
import 'package:crash_inspector/src/shared/http/http_client.dart';

class GlobalModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const home.Page(),
    );
  }
}
