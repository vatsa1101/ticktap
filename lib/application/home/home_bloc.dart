import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:ticktap/data/localDb/local_db.dart';
import '../../domain/utils/event.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState homeInitial) : super(homeInitial) {
    on<GenerateButtonClickedEvent>((event, emit) async {
      emit(GeneratingRandomNumberState());
      final int number = Random().nextInt(60);
      final int seconds = DateTime.now().second;
      bool success = false;
      if (number == seconds) {
        success = true;
        await LocalDb.addSuccessfulTap();
      }
      emit(RandomNumberGeneratedState(
        number: number,
        success: success,
      ));
    });
  }
}
