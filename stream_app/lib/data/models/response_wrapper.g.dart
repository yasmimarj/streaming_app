// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseWrapper<T> _$ResponseWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseWrapper<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseWrapperToJson<T>(
  ResponseWrapper<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'pagination': instance.pagination,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      pageCount: (json['pageCount'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'pageCount': instance.pageCount,
      'total': instance.total,
    };
