import 'package:crash_inspector/src/features/detail/data/data_sources/remote/orders_impl_api.dart';
import 'package:crash_inspector/src/features/detail/data/repositories/orders_repo_impl.dart';
import 'package:crash_inspector/src/features/detail/domain/repositories/abstract_orders_repository.dart';
import 'package:crash_inspector/src/features/detail/domain/usecases/get_order_usecase.dart';
import 'package:crash_inspector/src/features/detail/domain/usecases/get_search_order_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InjectDetail {
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
