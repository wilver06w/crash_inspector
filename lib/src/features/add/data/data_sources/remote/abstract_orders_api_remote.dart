import 'package:crash_inspector/src/features/detail/data/models/archetype.dart';
import 'package:crash_inspector/src/features/detail/data/models/get_orders.dart';

abstract class AbstractOrdersApiRemote {
  Future<List<Archetype>> getOrders();
  Future<GetOrders> setSearchOrder(
    String search,
  );
}
