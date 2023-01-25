

import 'package:get_it/get_it.dart';
import 'package:reservamos_challenge/application/pages/home_page/bloc/home_logic_bloc.dart';
import 'package:reservamos_challenge/data/datasources/home_remote_datasource.dart';
import 'package:reservamos_challenge/data/repositories/home_repo_impl.dart';
import 'package:reservamos_challenge/domain/repositories/home_repo.dart';
import 'package:reservamos_challenge/domain/usecases/advice_usecases.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl == service locator


Future<void> init() async {

// ! application layer

//Factory = every time a new/fresh instance of that class

sl.registerFactory(() => HomeLogicBloc(homeUseCase: sl()));

// ! domain layer
sl.registerFactory(() => HomeLogicUsesCases(homeRepo: sl()));

// ! data layer

sl.registerFactory<HomeRepo>(() => HomeRepoImpl(homeRemoteDatasource: sl()));
sl.registerFactory<HomeRemoteDatasource>(() => HomeRemoteDatasourceImpl(client: sl()));

// ! externs
sl.registerFactory(() => http.Client());
}
