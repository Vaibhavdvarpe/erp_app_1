import 'dart:convert';

ChangePassModel changePassModelFromJson(String str) =>
    ChangePassModel.fromJson(json.decode(str));

String changePassModelToJson(ChangePassModel data) =>
    json.encode(data.toJson());

class ChangePassModel {
  String? value;
  bool? success;
  String? resultMessage;

  ChangePassModel({this.value, this.success, this.resultMessage});

  ChangePassModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    success = json['success'];
    resultMessage = json['resultMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['success'] = success;
    data['resultMessage'] = resultMessage;
    return data;
  }
}
