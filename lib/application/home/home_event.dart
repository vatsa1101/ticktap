part of 'home_bloc.dart';

abstract class HomeEvent extends Event {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GenerateButtonClickedEvent extends HomeEvent {}
