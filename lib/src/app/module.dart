import 'package:crash_inspector/src/features/detail/inject.dart';
import 'package:crash_inspector/src/features/home/inject.dart';
import 'package:crash_inspector/src/shared/http/http_client.dart';
import 'package:crash_inspector/src/shared/module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HttpClient>(HttpClient.new);

    InjectDetail.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      '/',
      module: GlobalModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
