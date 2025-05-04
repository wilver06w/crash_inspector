import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../../data/models/errors_model.dart';

abstract class AbstractListErrorsRepository {
  Future<Either<Failure, List< ErrorsModel>>> getListErrors();
}
