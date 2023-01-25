
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:reservamos_challenge/data/repositories/home_repo_impl.dart';
import 'package:reservamos_challenge/domain/repositories/home_repo.dart';

import '../entities/homelogic_entity.dart';
import '../failures/failures.dart';

class HomeLogicUsesCases {
  HomeLogicUsesCases({required this.homeRepo});
  final HomeRepo homeRepo;

  Future <Either<Failure,HomeLogicEntity>> getHomeLogic() async {

    return homeRepo.getHomeLogicFromDatasource();


    //business logic
  }
}