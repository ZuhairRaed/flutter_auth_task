// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponse _$$_LoginResponseFromJson(Map<String, dynamic> json) =>
    _$_LoginResponse(
      json['twoFactorToken'] as String,
      DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$_LoginResponseToJson(_$_LoginResponse instance) =>
    <String, dynamic>{
      'twoFactorToken': instance.twoFactorToken,
      'expiresAt': instance.expiresAt.toIso8601String(),
    };
