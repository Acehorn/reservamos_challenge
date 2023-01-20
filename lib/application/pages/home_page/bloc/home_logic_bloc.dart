import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_logic_event.dart';
part 'home_logic_state.dart';

class HomeLogicBloc extends Bloc<HomeLogicEvent, HomeLogicState> {

  HomeLogicBloc() : super(HomeLogicInitial()) {

    on<HomeRequestedEvent>((event, emit) async {
     emit(HomeLStateLoading()); 
     //execute business logic
     //for example get and advice
     debugPrint("i'm fake api call");
    await Future.delayed(const Duration(seconds: 3), (){});
     debugPrint("got it");
    // emit(HomeLStateLoaded(advice: "fake message from api"));
     emit(HomeLStateError(message: "error message"));
    });


    
  }
}
