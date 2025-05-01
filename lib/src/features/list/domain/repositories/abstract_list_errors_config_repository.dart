import 'package:crash_inspector/src/features/list/data/models/list_errors_models.dart';
import 'package:crash_inspector/src/shared/http/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AbstractListErrorsRepository {
  Future<Either<Failure, ListErrorsModels>> getListErrors();
}
