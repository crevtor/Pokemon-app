import 'package:json_annotation/json_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponse {
  bool? status;
  String? message;
  String? traceId;

  BaseResponse(this.message, this.status, this.traceId);

  // from json
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
