import 'package:effective_error_handling/src/features/home/inject.dart';
import 'package:effective_error_handling/src/shared/http/http_client.dart';
import 'package:effective_error_handling/src/shared/module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HttpClient>(HttpClient.new);

    InjectHome.binds(i);
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
