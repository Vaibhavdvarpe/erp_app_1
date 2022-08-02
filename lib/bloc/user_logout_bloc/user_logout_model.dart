class LogoutModel {
  bool? success;
  String? resultMessage;

  LogoutModel({this.success, this.resultMessage});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    resultMessage = json['resultMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['resultMessage'] = resultMessage;
    return data;
  }
}