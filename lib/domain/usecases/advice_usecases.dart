
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../entities/homelogic_entity.dart';
import '../failures/failures.dart';

class HomeLogicUsesCases {

  Future <Either<Failure,HomeLogicEntity>> getHomeLogic() async {

    var headers = {
      "Content-Type": "application/json",
    };
  String place = "tlalnepantla";
   final resp = await http.get(Uri.parse("https://search.reservamos.mx/api/v2/places?q=$place"));
    final decodedData = json.decode(resp.body);
     
    return right(HomeLogicEntity(id: decodedData[0]["id"], cityName: decodedData[0]["city_name"], state: decodedData[0]["state"], country: decodedData[0]["country"], lat: decodedData[0]["lat"], long: decodedData[0]["long"]));
  // return left(ServerFailure());
  }
}