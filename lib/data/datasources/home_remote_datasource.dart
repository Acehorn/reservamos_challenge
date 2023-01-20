
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/home_datasource_model.dart';


abstract class HomeRemoteDatasource {
  Future<HomeDataSourceModel> getRandomHomeFromApi();
  


}

class  HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final client = http.Client();
  @override
  Future <HomeDataSourceModel> getRandomHomeFromApi() async {
      String place = "tlalnepantla";
     final response = await client.get(Uri.parse("https://search.reservamos.mx/api/v2/places?q=$place"),
         headers: {
         'Content-Type' : 'application/json',
      },);

      final responseBody = json.decode(response.body);

      return HomeDataSourceModel.fromJson(responseBody[0]);
  }
  
}