import 'package:dartz/dartz.dart';
import 'package:reservamos_challenge/domain/repositories/home_repo.dart';
import '../entities/homelogic_entity.dart';
import '../failures/failures.dart';

class HomeLogicUsesCases {
  HomeLogicUsesCases({required this.homeRepo});
  final HomeRepo homeRepo;

  Future <Either<Failure,HomeLogicEntity>> getHomeLogic(String place) async {

    return homeRepo.getHomeLogicFromDatasource(place);
    //business logic
  }
}