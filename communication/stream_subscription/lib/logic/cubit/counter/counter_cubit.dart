import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial(counter: 0));

  void increment() => emit(CounterIncrement(counter: state.counter + 1));

  void decrement() => emit(CounterDecrement(counter: state.counter - 1));
}
