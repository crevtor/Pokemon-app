class DefaultSuccessResponse {
  bool? status;
  String? message;
  String? traceId;

  DefaultSuccessResponse({this.status, this.message, this.traceId});

  DefaultSuccessResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    traceId = json['traceId'];
  }

  @override
  String toString() {
    return 'DefaultSuccessResponse{status: $status, message: $message, traceId: $traceId}';
  }
}