import 'package:dartz/dartz.dart';
import 'package:effective_error_handling/src/features/home/data/models/get_orders.dart';
import 'package:effective_error_handling/src/features/home/domain/repositories/abstract_orders_repository.dart';
import 'package:effective_error_handling/src/shared/http/failures.dart';

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
