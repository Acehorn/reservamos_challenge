import 'package:reservamos_challenge/data/datasources/home_remote_datasource.dart';
import 'package:reservamos_challenge/domain/failures/failures.dart';
import 'package:reservamos_challenge/domain/entities/homelogic_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:reservamos_challenge/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource homeRemoteDatasource = HomeRemoteDatasourceImpl();
  @override
  Future<Either<Failure, HomeLogicEntity>> getHomeLogicFromDatasource() async {
    final result = await  homeRemoteDatasource.getRandomHomeFromApi();
    return right(result);
  }
}
