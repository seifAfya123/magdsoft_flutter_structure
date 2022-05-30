class ApiResponse {
  int? status;
  String? message;
  ApiResponse({
    required this.status,
    required this.message,
  });
  factory ApiResponse.fromjson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
    );
  }
}

class MyResponse {
  List<dynamic>? persons;
  int? status;
  String? message;
  MyResponse({
    required this.persons,
    required this.status,
    required this.message,
  });
  factory MyResponse.fromJson(Map<String, dynamic> json) {
    return MyResponse(
      status: json['status'],
      persons: json['account'] as List<dynamic>?,
      message: json['message'],
    );
  }
}
