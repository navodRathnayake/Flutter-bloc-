library counter_cubit;

import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

abstract class CounterState {
  late int counter;
  late bool isIncremented;
}

class CounterInitialState implements CounterState {
  @override
  int counter;

  @override
  bool isIncremented;

  CounterInitialState({required this.counter, required this.isIncremented});
}

class OnTappedCounterState implements CounterState {
  @override
  int counter;

  @override
  bool isIncremented;

  OnTappedCounterState({required this.counter, required this.isIncremented});
}
