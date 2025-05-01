import 'package:crash_inspector/src/features/list/data/data_sources/remote/list_impl_api.dart';
import 'package:crash_inspector/src/features/list/data/models/list_errors_models.dart';
import 'package:crash_inspector/src/features/list/domain/repositories/abstract_list_errors_config_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:crash_inspector/src/shared/http/failures.dart';

class ListErrorsRepositoryImpl extends AbstractListErrorsRepository {
  ListErrorsRepositoryImpl({
    required this.apiRemote,
  });
  final ListErrorsImplApiRemote apiRemote;

  @override
  Future<Either<Failure, ListErrorsModels>> getListErrors() async {
    try {
      final result = await apiRemote.getListErrors();
      return Right(result);
    } on Failure catch (e) {
      return Left<Failure, ListErrorsModels>(e);
    }
  }
}
