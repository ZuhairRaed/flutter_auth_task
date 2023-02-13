// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyEmailRequest _$$_VerifyEmailRequestFromJson(
        Map<String, dynamic> json) =>
    _$_VerifyEmailRequest(
      token: json['token'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_VerifyEmailRequestToJson(
        _$_VerifyEmailRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'code': instance.code,
    };
