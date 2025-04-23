import 'package:effective_error_handling/src/features/home/data/data_sources/remote/orders_impl_api.dart';
import 'package:effective_error_handling/src/features/home/data/repositories/orders_repo_impl.dart';
import 'package:effective_error_handling/src/features/home/domain/repositories/abstract_orders_repository.dart';
import 'package:effective_error_handling/src/features/home/domain/usecases/get_order_usecase.dart';
import 'package:effective_error_handling/src/features/home/domain/usecases/get_search_order_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InjectHome {
  static void binds(Injector i) {
    i
      ..addLazySingleton<OrdersImplApiRemote>(OrdersImplApiRemote.new)
      ..addLazySingleton<AbstractOrdersRepository>(OrdersRepositoryImpl.new)
      ..addLazySingleton<GetOrdersUseCase>(
        GetOrdersUseCase.new,
      )
      ..addLazySingleton<GetSearchOrdersUseCase>(
        GetSearchOrdersUseCase.new,
      );
  }
}
