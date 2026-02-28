class ResponseResult {
  final bool isSuccess;
  final String message;
  final int code;
  final dynamic data;

  ResponseResult({
    required this.isSuccess,
    required this.message,
    required this.code,
    this.data,
  });

  factory ResponseResult.fromJson(Map<String, dynamic> json) {
    return ResponseResult(
      isSuccess: json['isSuccess'] ?? false,
      message: json['message'] ?? '',
      code: json['code'] ?? 0,
      data: json['data'],
    );
  }
}