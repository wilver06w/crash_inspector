import 'package:dartz/dartz.dart';
import 'package:crash_inspector/src/features/detail/data/models/get_orders.dart';
import 'package:crash_inspector/src/features/detail/domain/repositories/abstract_orders_repository.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';

class GetSearchOrdersUseCase {
  GetSearchOrdersUseCase({
    required this.repository,
  });
  final AbstractOrdersRepository repository;

  Future<Either<Failure, GetOrders>> setSearchOrder({
    required String search,
  }) async {
    final result = await repository.setSearchOrder(
      search,
    );

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
