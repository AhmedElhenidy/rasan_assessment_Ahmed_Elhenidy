import 'package:rasan_flutter_assessment/domain/model/color_model.dart';

class ColorModelResponse {
  ColorModelResponse({
    this.red,
    this.groupOfColors,});

  ColorModelResponse.fromJson(dynamic json) {
    red = json['red'];
    groupOfColors = json['groupOfColors'] != null ? GroupOfColors.fromJson(json['groupOfColors']) : null;
  }
  String? red;
  GroupOfColors? groupOfColors;
}