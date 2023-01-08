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

class CounterOnPressed implements CounterState {
  @override
  int counter;

  @override
  bool isIncremented;

  CounterOnPressed({required this.counter, required this.isIncremented});
}
