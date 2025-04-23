import 'package:dartz/dartz.dart';
import 'package:crash_inspector/src/features/detail/data/models/archetype.dart';
import 'package:crash_inspector/src/features/detail/data/models/get_orders.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';

abstract class AbstractOrdersRepository {
  Future<Either<Failure, List<Archetype>>> getOrders();
  Future<Either<Failure, GetOrders>> setSearchOrder(
    String search,
  );
}
