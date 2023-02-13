// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyEmailRequest _$VerifyEmailRequestFromJson(Map<String, dynamic> json) {
  return _VerifyEmailRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyEmailRequest {
  String get token => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyEmailRequestCopyWith<VerifyEmailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailRequestCopyWith<$Res> {
  factory $VerifyEmailRequestCopyWith(
          VerifyEmailRequest value, $Res Function(VerifyEmailRequest) then) =
      _$VerifyEmailRequestCopyWithImpl<$Res, VerifyEmailRequest>;
  @useResult
  $Res call({String token, String code});
}

/// @nodoc
class _$VerifyEmailRequestCopyWithImpl<$Res, $Val extends VerifyEmailRequest>
    implements $VerifyEmailRequestCopyWith<$Res> {
  _$VerifyEmailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifyEmailRequestCopyWith<$Res>
    implements $VerifyEmailRequestCopyWith<$Res> {
  factory _$$_VerifyEmailRequestCopyWith(_$_VerifyEmailRequest value,
          $Res Function(_$_VerifyEmailRequest) then) =
      __$$_VerifyEmailRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String code});
}

/// @nodoc
class __$$_VerifyEmailRequestCopyWithImpl<$Res>
    extends _$VerifyEmailRequestCopyWithImpl<$Res, _$_VerifyEmailRequest>
    implements _$$_VerifyEmailRequestCopyWith<$Res> {
  __$$_VerifyEmailRequestCopyWithImpl(
      _$_VerifyEmailRequest _value, $Res Function(_$_VerifyEmailRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? code = null,
  }) {
    return _then(_$_VerifyEmailRequest(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyEmailRequest implements _VerifyEmailRequest {
  const _$_VerifyEmailRequest({required this.token, required this.code});

  factory _$_VerifyEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$$_VerifyEmailRequestFromJson(json);

  @override
  final String token;
  @override
  final String code;

  @override
  String toString() {
    return 'VerifyEmailRequest(token: $token, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyEmailRequest &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyEmailRequestCopyWith<_$_VerifyEmailRequest> get copyWith =>
      __$$_VerifyEmailRequestCopyWithImpl<_$_VerifyEmailRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifyEmailRequestToJson(
      this,
    );
  }
}

abstract class _VerifyEmailRequest implements VerifyEmailRequest {
  const factory _VerifyEmailRequest(
      {required final String token,
      required final String code}) = _$_VerifyEmailRequest;

  factory _VerifyEmailRequest.fromJson(Map<String, dynamic> json) =
      _$_VerifyEmailRequest.fromJson;

  @override
  String get token;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyEmailRequestCopyWith<_$_VerifyEmailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
