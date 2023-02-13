import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_response.freezed.dart';
part 'verify_email_response.g.dart';

@freezed
class VerifyEmailResponse with _$VerifyEmailResponse {
  const factory VerifyEmailResponse({
    required String access,
    required String refresh,
  }) = _VerifyEmailResponse;
  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) => _$VerifyEmailResponseFromJson(json);
}
