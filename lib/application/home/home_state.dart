part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class GeneratingRandomNumberState extends HomeState {}

class RandomNumberGeneratedState extends HomeState {
  final int number;
  final bool success;

  const RandomNumberGeneratedState(
      {required this.number, required this.success});

  @override
  List<Object> get props => [number, success];
}
