class BaseApiResponse<T> {
  final int statusCode;
  final String status;
  final String message;
  final T result;

  const BaseApiResponse({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.result,
  });

  BaseApiResponse<T> copyWith({
    int? statusCode,
    String? status,
    String? message,
    T? result,
  }) {
    return BaseApiResponse<T>(
      statusCode: statusCode ?? this.statusCode,
      status: status ?? this.status,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  factory BaseApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJson,
  ) {
    return BaseApiResponse<T>(
      statusCode: json['status_code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
      result: fromJson(json['result']),
    );
  }

  factory BaseApiResponse.success(T result) {
    return BaseApiResponse<T>(
      statusCode: 200,
      status: 'success',
      message: 'Success',
      result: result,
    );
  }

  factory BaseApiResponse.error(String message) {
    return BaseApiResponse<T>(
      statusCode: 500,
      status: 'error',
      message: message,
      result: null as T,
    );
  }

  Map<String, dynamic> toJson([dynamic Function(T)? toJson]) {
    return {
      'status_code': statusCode,
      'status': status,
      'message': message,
      'result': toJson != null ? toJson(result) : result,
    };
  }

  bool get isSuccess => status == 'success';
  bool get isError => status == 'error';
}
