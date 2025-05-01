import 'package:crash_inspector/src/features/list/data/models/errors_model.dart';

abstract class AbstractListErrorApiRemote {
  Future<List<ErrorsModel>> getListErrors();
}
