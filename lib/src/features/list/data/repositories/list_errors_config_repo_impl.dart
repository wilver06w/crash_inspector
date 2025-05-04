import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../../domain/repositories/abstract_list_errors_config_repository.dart';
import '../data_sources/remote/list_impl_api.dart';
import '../models/errors_model.dart';

class ListErrorsRepositoryImpl extends AbstractListErrorsRepository {
  ListErrorsRepositoryImpl({
    required this.apiRemote,
  });
  final ListErrorsImplApiRemote apiRemote;

  @override
  Future<Either<Failure, List<ErrorsModel>>> getListErrors() async {
    try {
      final List<ErrorsModel> result = await apiRemote.getListErrors();
      return Right<Failure, List<ErrorsModel>>(result);
    } on Failure catch (e) {
      return Left<Failure, List<ErrorsModel>>(e);
    }
  }
}
