library counter_cubit;

import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState(counter: 0, isIncremented: false));

  void increment() => emit(
      CounterOnPressedState(counter: state.counter + 1, isIncremented: true));

  void decrement() => emit(
      CounterOnPressedState(counter: state.counter - 1, isIncremented: false));
}
