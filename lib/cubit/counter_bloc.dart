import 'package:flutter_bloc/flutter_bloc.dart';
class CounterEvent{}
class CounterIncremented extends CounterEvent {}
class CounterDecrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {

  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) => emit(state + 1));

    on<CounterDecrement>((event, emit) => emit(state - 1));
  }
}
