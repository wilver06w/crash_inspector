import 'package:crash_inspector/src/features/list/data/models/errors_model.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AbstractListErrorsRepository {
  Future<Either<Failure, List< ErrorsModel>>> getListErrors();
}
