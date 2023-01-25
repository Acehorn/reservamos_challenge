import 'package:reservamos_challenge/data/datasources/home_remote_datasource.dart';
import 'package:reservamos_challenge/data/exceptions/exceptions.dart';
import 'package:reservamos_challenge/domain/failures/failures.dart';
import 'package:reservamos_challenge/domain/entities/homelogic_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:reservamos_challenge/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource homeRemoteDatasource;
  HomeRepoImpl({required this.homeRemoteDatasource});

  @override
  Future<Either<Failure, HomeLogicEntity>> getHomeLogicFromDatasource() async {
    try {
      final result = await homeRemoteDatasource.getRandomHomeFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      //handle the exception
      return left(GeneralFailure());
    }
  }
}
