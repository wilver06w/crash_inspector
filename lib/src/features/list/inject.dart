import 'package:crash_inspector/src/features/list/data/data_sources/remote/list_impl_api.dart';
import 'package:crash_inspector/src/features/list/data/repositories/list_errors_config_repo_impl.dart';
import 'package:crash_inspector/src/features/list/domain/repositories/abstract_list_errors_config_repository.dart';
import 'package:crash_inspector/src/features/list/domain/usecases/get_list_errors_usecase.dart';
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
      );
  }
}
