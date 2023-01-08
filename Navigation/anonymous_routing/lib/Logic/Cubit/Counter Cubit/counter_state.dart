part of 'counter_cubit.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState(counter: 0, isIncremented: false));

  void increment() => emit(
      OnTappedCounterState(counter: state.counter + 1, isIncremented: true));

  void decrement() => emit(
      OnTappedCounterState(counter: state.counter - 1, isIncremented: false));
}
