import 'package:dartz/dartz.dart';
import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/features/home/domain/repositories/abstract_orders_repository.dart';
import 'package:effective_error_handling/src/shared/http/failures.dart';

class GetOrdersUseCase {
  GetOrdersUseCase({
    required this.repository,
  });
  final AbstractOrdersRepository repository;

  Future<Either<Failure, List<Archetype>>> getOrders() async {
    final result = await repository.getOrders();

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
