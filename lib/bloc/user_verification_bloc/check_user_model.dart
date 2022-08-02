class CheckUserModel {
  Value? value;
  bool? success;
  String? resultMessage;

  String? mobileNo;

  CheckUserModel({this.value, this.success, this.resultMessage});

  CheckUserModel.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? Value.fromJson(json['value']) : null;
    success = json['success'];
    resultMessage = json['resultMessage'];
  }

  get otp => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (value != null) {
      data['value'] = value!.toJson();
    }
    data['success'] = success;
    data['resultMessage'] = resultMessage;
    return data;
  }
}

class Value {
  String? smsurl;
  bool? isOTP;
  String? otp;
  String? mobileNo;
  String? email;
  bool? deviceLock;

  // ignore: prefer_typing_uninitialized_variables
  var resultMessage;

  Value(
      {this.smsurl,
      this.isOTP,
      this.otp,
      this.mobileNo,
      this.email,
      this.deviceLock});

  Value.fromJson(Map<String, dynamic> json) {
    smsurl = json['smsurl'];
    isOTP = json['isOTP'];
    otp = json['otp'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    deviceLock = json['deviceLock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['smsurl'] = smsurl;
    data['isOTP'] = isOTP;
    data['otp'] = otp;
    data['mobileNo'] = mobileNo;
    data['email'] = email;
    data['deviceLock'] = deviceLock;
    return data;
  }
}
