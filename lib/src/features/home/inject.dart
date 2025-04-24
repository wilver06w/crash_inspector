import 'package:crash_inspector/src/features/home/data/data_sources/remote/sentry_impl_api.dart';
import 'package:crash_inspector/src/features/home/data/repositories/sentry_config_repo_impl.dart';
import 'package:crash_inspector/src/features/home/domain/repositories/abstract_sentry_config_repository.dart';
import 'package:crash_inspector/src/features/home/domain/usecases/get_sentry_configs_usecase.dart';
import 'package:crash_inspector/src/features/home/domain/usecases/remove_sentry_config_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InjectHome {
  static void binds(Injector i) {
    i
      ..addLazySingleton<SentryImplApiRemote>(SentryImplApiRemote.new)
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
