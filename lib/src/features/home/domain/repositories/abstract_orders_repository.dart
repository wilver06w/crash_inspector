import 'package:dartz/dartz.dart';
import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/features/home/data/models/get_orders.dart';
import 'package:effective_error_handling/src/shared/http/failures.dart';

abstract class AbstractOrdersRepository {
  Future<Either<Failure, List<Archetype>>> getOrders();
  Future<Either<Failure, GetOrders>> setSearchOrder(
    String search,
  );
}
