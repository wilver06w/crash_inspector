// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetOrdersImpl _$$GetOrdersImplFromJson(Map<String, dynamic> json) =>
    _$GetOrdersImpl(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetOrdersImplToJson(_$GetOrdersImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: (json['last_page'] as num).toInt(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'last_page': instance.lastPage,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: (json['id'] as num).toInt(),
      address: json['address'] as String,
      client: json['client'] as String,
      collectionDate: DateTime.parse(json['collection_date'] as String),
      deliveryDate: DateTime.parse(json['delivery_date'] as String),
      number: json['number'] as String,
      phone: json['phone'] as String,
      value: (json['value'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'client': instance.client,
      'collection_date': instance.collectionDate.toIso8601String(),
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'number': instance.number,
      'phone': instance.phone,
      'value': instance.value,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
