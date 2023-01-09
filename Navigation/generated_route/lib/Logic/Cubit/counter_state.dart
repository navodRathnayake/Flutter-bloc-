part of 'counter_cubit.dart';

abstract class CounterState {
  late final int counter;
  late final bool isIncremented;
}

class CounterInitialState implements CounterState {
  @override
  int counter;

  @override
  bool isIncremented;

  CounterInitialState({required this.counter, required this.isIncremented});
}

class CounterOnPressedState implements CounterState {
  @override
  int counter;

  @override
  bool isIncremented;

  CounterOnPressedState({required this.counter, required this.isIncremented});
}
