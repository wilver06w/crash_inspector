import '../../models/errors_model.dart';

abstract class AbstractListErrorApiRemote {
  Future<List<ErrorsModel>> getListErrors();
}
