part of 'home_logic_bloc.dart';

@immutable
abstract class HomeLogicState {}

class HomeLogicInitial extends HomeLogicState {}


class HomeLStateLoading extends HomeLogicState {}

class HomeLStateLoaded extends HomeLogicState {
  final String advice;
  HomeLStateLoaded({required this.advice});
}

class HomeLStateError extends HomeLogicState {
  final String message;
  HomeLStateError({required this.message});
}
