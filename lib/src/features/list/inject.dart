import 'package:flutter_modular/flutter_modular.dart';

import 'data/data_sources/remote/list_impl_api.dart';
import 'data/repositories/list_errors_config_repo_impl.dart';
import 'domain/repositories/abstract_list_errors_config_repository.dart';
import 'domain/usecases/get_list_errors_usecase.dart';

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
