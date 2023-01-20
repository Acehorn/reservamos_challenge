import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reservamos_challenge/domain/failures/failures.dart';
import 'package:reservamos_challenge/domain/usecases/advice_usecases.dart';

part 'home_logic_event.dart';
part 'home_logic_state.dart';

const serverFailureMessage = "API ERROR, PLEASE TRY AGAIN";
const cacheFailureMessage = "SOMETHING GONE WRONG, PLEASE TRY AGAIN";
const generalFailureMessage = "something is not working, please try again";

class HomeLogicBloc extends Bloc<HomeLogicEvent, HomeLogicState> {
  HomeLogicBloc() : super(HomeLogicInitial()) {
    on<HomeRequestedEvent>((event, emit) async {
      final HomeLogicUsesCases homeUseCase = HomeLogicUsesCases();

      emit(HomeLStateLoading());
      final failureOrHomeLog = await homeUseCase.getHomeLogic();
      failureOrHomeLog.fold(
        (failure) =>
            emit(HomeLStateError(message: _mapFailureToMessage(failure))),
        (homeL) => emit(HomeLStateLoaded(advice: homeL.cityName)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
