import 'package:dartz/dartz.dart';

import '../../../../shared/http/failures.dart';
import '../../data/models/errors_model.dart';
import '../repositories/abstract_list_errors_config_repository.dart';

class GetListErrorsUseCase {
  GetListErrorsUseCase({
    required this.repository,
  });
  final AbstractListErrorsRepository repository;

  Future<Either<Failure, List<ErrorsModel>>> getListErrors() async {
    final Either<Failure, List<ErrorsModel>> result = await repository.getListErrors();

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
