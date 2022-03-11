import 'add_to_these_colors.dart';

class PersonalFavoriteColors {
  PersonalFavoriteColors({
    this.addToTheseColors,});

  PersonalFavoriteColors.fromJson(dynamic json) {
    if (json['addToTheseColors'] != null) {
      addToTheseColors = [];
      json['addToTheseColors'].forEach((v) {
        addToTheseColors?.add(AddToTheseColors.fromJson(v));
      });
    }
  }
  List<AddToTheseColors>? addToTheseColors;
}