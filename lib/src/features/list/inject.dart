import 'package:crash_inspector/src/features/home/data/data_sources/remote/sentry_impl_api.dart';
import 'package:crash_inspector/src/features/home/data/repositories/sentry_config_repo_impl.dart';
import 'package:crash_inspector/src/features/home/domain/repositories/abstract_sentry_config_repository.dart';
import 'package:crash_inspector/src/features/home/domain/usecases/get_sentry_configs_usecase.dart';
import 'package:crash_inspector/src/features/home/domain/usecases/remove_sentry_config_usecase.dart';
import 'package:crash_inspector/src/features/list/data/data_sources/remote/list_impl_api.dart';
import 'package:crash_inspector/src/features/list/data/repositories/list_errors_config_repo_impl.dart';
import 'package:crash_inspector/src/features/list/domain/repositories/abstract_list_errors_config_repository.dart';
import 'package:crash_inspector/src/features/list/domain/usecases/get_list_errors_usecase.dart';
import 'package:crash_inspector/src/features/list/domain/usecases/remove_list_errors_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InjectList {
  static void binds(Injector i) {
    i
      ..addLazySingleton<ListErrorsImplApiRemote>(ListErrorsImplApiRemote.new)
      //
      ..addLazySingleton<AbstractListErrorsRepository>(
        ListErrorsRepositoryImpl.new,
      )
      ..addLazySingleton<GetListErrorsUseCase>(
        GetListErrorsUseCase.new,
      )
      ..addLazySingleton<RemoveListErrorsUseCase>(
        RemoveListErrorsUseCase.new,
      );
  }
}
