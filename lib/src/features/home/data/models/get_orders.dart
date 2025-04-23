import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_orders.freezed.dart';
part 'get_orders.g.dart';

@freezed
class GetOrders with _$GetOrders {
  const factory GetOrders({
    required Data data,
  }) = _GetOrders;

  factory GetOrders.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'current_page') required int currentPage,
    required List<Datum> data,
    @JsonKey(name: 'last_page') required int lastPage,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    required int id,
    required String address,
    required String client,
    @JsonKey(name: 'collection_date') required DateTime collectionDate,
    @JsonKey(name: 'delivery_date') required DateTime deliveryDate,
    required String number,
    required String phone,
    required int value,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
