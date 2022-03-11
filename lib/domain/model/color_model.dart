import 'package:rasan_flutter_assessment/domain/model/personal_favourite_color.dart';
import 'async_validation.dart';

class GroupOfColors {
  GroupOfColors({
      this.asyncValidationColors, 
      required this.autoSuggestionsColors,
      this.personalFavoriteColors,});

  GroupOfColors.fromJson(dynamic json) {
    if (json['asyncValidationColors'] != null) {
      asyncValidationColors = [];
      json['asyncValidationColors'].forEach((v) {
        asyncValidationColors?.add(AsyncValidationColors.fromJson(v));
      });
    }
    autoSuggestionsColors = json['autoSuggestionsColors'] != null ? json['autoSuggestionsColors'].cast<String>() : [];
    personalFavoriteColors = json['personalFavoriteColors'] != null ? PersonalFavoriteColors.fromJson(json['personalFavoriteColors']) : null;
  }
  List<AsyncValidationColors>? asyncValidationColors;
  List<String> autoSuggestionsColors= [];
  PersonalFavoriteColors? personalFavoriteColors;
}





