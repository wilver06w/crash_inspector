import 'package:crash_inspector/src/features/list/data/models/list_errors_models.dart';

abstract class AbstractListErrorApiRemote {
  Future<ListErrorsModels> getListErrors();
}
