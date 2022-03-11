class AsyncValidationColors {
  AsyncValidationColors({
    this.color,
    this.error,
    this.errorMessage,});

  AsyncValidationColors.fromJson(dynamic json) {
    color = json['color'];
    error = json['error'];
    errorMessage = json['errorMessage'];
  }
  String? color;
  String? error;
  String? errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color'] = color;
    map['error'] = error;
    map['errorMessage'] = errorMessage;
    return map;
  }

}