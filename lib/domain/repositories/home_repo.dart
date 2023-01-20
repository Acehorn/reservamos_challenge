import 'package:dartz/dartz.dart';
import 'package:reservamos_challenge/domain/entities/homelogic_entity.dart';
import 'package:reservamos_challenge/domain/failures/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeLogicEntity>> getHomeLogicFromDatasource();
}
