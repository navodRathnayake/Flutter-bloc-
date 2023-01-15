part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int counter = 0;
}

class CounterInitial implements CounterState {
  @override
  final int counter;

  const CounterInitial({required this.counter});
}

class CounterIncrement implements CounterState {
  @override
  final int counter;
  const CounterIncrement({required this.counter});
}

class CounterDecrement implements CounterState {
  @override
  final int counter;
  const CounterDecrement({required this.counter});
}
