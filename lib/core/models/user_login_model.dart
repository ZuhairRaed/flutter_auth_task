class UserLoginModel {
  String? twoFactorToken;
  String? expiresAt;
  UserLoginModel();
  UserLoginModel.loginConst(
    this.twoFactorToken,
    this.expiresAt,
  );

  factory UserLoginModel.fromJson(Map<String, String> json) => 
  UserLoginModel.loginConst(json['twoFactorToken'], json['expiresAt']);
  Map<String, String> toJson(){
    final userData = <String, String>{};
    userData['twoFactorToken'] = twoFactorToken ?? '';
    userData['expiresAt'] = expiresAt ?? '';
    return userData;
  }
}
