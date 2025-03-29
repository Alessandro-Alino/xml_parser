// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xml_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XMLModel _$XMLModelFromJson(Map<String, dynamic> json) => _XMLModel(
      api: json['api'] as String,
      method: $enumDecode(_$MethodEnumMap, json['method']),
    );

Map<String, dynamic> _$XMLModelToJson(_XMLModel instance) => <String, dynamic>{
      'api': instance.api,
      'method': _$MethodEnumMap[instance.method]!,
    };

const _$MethodEnumMap = {
  Method.get: 'get',
  Method.post: 'post',
  Method.put: 'put',
  Method.patch: 'patch',
  Method.delete: 'delete',
  Method.options: 'options',
  Method.head: 'head',
  Method.trace: 'trace',
  Method.connect: 'connect',
};
