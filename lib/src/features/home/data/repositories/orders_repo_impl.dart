import 'package:dartz/dartz.dart';
import 'package:effective_error_handling/src/features/home/data/data_sources/remote/orders_impl_api.dart';
import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/features/home/data/models/get_orders.dart';
import 'package:effective_error_handling/src/features/home/domain/repositories/abstract_orders_repository.dart';
import 'package:effective_error_handling/src/shared/http/exceptions.dart';
import 'package:effective_error_handling/src/shared/http/failures.dart';

class OrdersRepositoryImpl extends AbstractOrdersRepository {
  OrdersRepositoryImpl({
    required this.apiRemote,
  });
  final OrdersImplApiRemote apiRemote;

  @override
  Future<Either<Failure, List<Archetype>>> getOrders() async {
    try {
      final result = await apiRemote.getOrders();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GetOrders>> setSearchOrder(
    String search,
  ) async {
    try {
      final result = await apiRemote.setSearchOrder(
        search,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
