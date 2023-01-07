part of 'counter_cubit.dart';

abstract class CounterState {
  late int counterValue;
  late bool isIncremented;
}

class CounterInitial implements CounterState {
  @override
  int counterValue;

  @override
  bool isIncremented;
  CounterInitial({required this.counterValue, required this.isIncremented});
}

class OnPressedCounterState implements CounterState {
  @override
  int counterValue;

  @override
  bool isIncremented;

  OnPressedCounterState(
      {required this.counterValue, required this.isIncremented});
}
