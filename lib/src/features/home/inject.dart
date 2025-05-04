import 'package:flutter_modular/flutter_modular.dart';

import 'data/data_sources/remote/home_impl_api.dart';
import 'data/repositories/home_config_repo_impl.dart';
import 'domain/repositories/abstract_sentry_config_repository.dart';
import 'domain/usecases/get_sentry_configs_usecase.dart';
import 'domain/usecases/remove_sentry_config_usecase.dart';

class InjectHome {
  static void binds(Injector i) {
    i
      ..addLazySingleton<HomeImplApiRemote>(HomeImplApiRemote.new)
      //
      ..addLazySingleton<AbstractSentryConfigRepository>(
        SentryRepositoryImpl.new,
      )
      ..addLazySingleton<GetSentryConfigsUseCase>(
        GetSentryConfigsUseCase.new,
      )
      ..addLazySingleton<RemoveSentryConfigUseCase>(
        RemoveSentryConfigUseCase.new,
      );
  }
}
