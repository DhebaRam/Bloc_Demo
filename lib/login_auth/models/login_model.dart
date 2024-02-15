class AuthLoginModel {
  bool? status;
  String? message;
  UserData? data;
  int? responsecode;

  AuthLoginModel({this.status, this.message, this.data, this.responsecode});

  AuthLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    responsecode = json['responsecode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['responsecode'] = responsecode;
    return data;
  }
}

class UserData {
  int? id;
  String? memberId;
  String? name;
  String? email;
  dynamic countryCode;
  String? mobile;
  String? dob;
  String? address;
  String? profile;
  dynamic emailVerifiedAt;
  String? pwd;
  int? status;
  String? myWalletAmount;
  dynamic socialId;
  dynamic loginType;
  String? language;
  dynamic fcmToken;
  String? createdAt;
  String? updatedAt;
  String? token;

  UserData(
      {this.id,
        this.memberId,
        this.name,
        this.email,
        this.countryCode,
        this.mobile,
        this.dob,
        this.address,
        this.profile,
        this.emailVerifiedAt,
        this.pwd,
        this.status,
        this.myWalletAmount,
        this.socialId,
        this.loginType,
        this.language,
        this.fcmToken,
        this.createdAt,
        this.updatedAt,
        this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    name = json['name'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    dob = json['dob'];
    address = json['address'];
    profile = json['profile'];
    emailVerifiedAt = json['email_verified_at'];
    pwd = json['pwd'];
    status = json['status'];
    myWalletAmount = json['my_wallet_amount'];
    socialId = json['social_id'];
    loginType = json['login_type'];
    language = json['language'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['name'] = name;
    data['email'] = email;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['dob'] = dob;
    data['address'] = address;
    data['profile'] = profile;
    data['email_verified_at'] = emailVerifiedAt;
    data['pwd'] = pwd;
    data['status'] = status;
    data['my_wallet_amount'] = myWalletAmount;
    data['social_id'] = socialId;
    data['login_type'] = loginType;
    data['language'] = language;
    data['fcm_token'] = fcmToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    return data;
  }
}
