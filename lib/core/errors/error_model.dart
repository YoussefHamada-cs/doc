class ErrorModel {
  String? message;
  dynamic data;
  bool? status;
  int? code;

  ErrorModel({this.message, this.data, this.status, this.code});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    message: json['message'] as String?,
    data: json['data'],
    status: json['status'] as bool?,
    code: json['code'] as int?,
  );

}
