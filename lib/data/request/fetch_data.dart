import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:rasan_flutter_assessment/data/response/colors_response.dart';

class FetchData{
  Future<ColorModelResponse> readJson() async {
    final String response = await rootBundle.loadString('assets/api_data.json');
    final data = await json.decode(response);
    //Future.delayed(const Duration(seconds: 5));
    return  ColorModelResponse.fromJson(data);

  }
}