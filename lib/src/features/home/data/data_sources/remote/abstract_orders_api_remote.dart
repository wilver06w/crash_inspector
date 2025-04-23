import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/features/home/data/models/get_orders.dart';

abstract class AbstractOrdersApiRemote {
  Future<List<Archetype>> getOrders();
  Future<GetOrders> setSearchOrder(
    String search,
  );
}
