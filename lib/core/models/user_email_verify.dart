class UserEmailVerifyModel{
  String? tocken;
  String? code;
  UserEmailVerifyModel({
    this.tocken,
    this.code,
  });

  factory UserEmailVerifyModel.fromJson(Map<String, String> json) => UserEmailVerifyModel(
    tocken: json['tocken'],
    code: json['code'],
  );
  Map<String, String> toJson(){
    final data = <String, String>{};
    data['tocken'] = tocken ?? '';
    data['code'] = code ?? '';
    return data;
  }
}