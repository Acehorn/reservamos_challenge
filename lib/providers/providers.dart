import 'dart:convert';

import '../models/getLatitudeModel.dart';
import 'package:http/http.dart' as http;
Future<GetLatitude> getPlaceLocate(String place) async {
    var headers = {
      "Content-Type": "application/json",
    };

    final resp = await http.get(Uri.parse("https://search.reservamos.mx/api/v2/places?q=$place"));
    final decodedData = json.decode(resp.body);
    final location =  GetLatitude.fromJson(decodedData);
    return location;
  
  }