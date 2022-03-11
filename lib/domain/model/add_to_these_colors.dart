class AddToTheseColors {
  AddToTheseColors({
    this.myFavoriteColor,
    this.secondFavoriteColor,});

  factory AddToTheseColors.fromJson(dynamic json) {
   return AddToTheseColors(
       myFavoriteColor : json['myFavoriteColor'],
       secondFavoriteColor : json['secondFavoriteColor']
   );
  }
  String? myFavoriteColor;
  String? secondFavoriteColor;
}