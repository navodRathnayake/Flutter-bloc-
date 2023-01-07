import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(counterValue: 0, isIncremented: false));

  void increment() => emit(OnPressedCounterState(
      counterValue: state.counterValue + 1, isIncremented: true));

  void decrement() => emit(OnPressedCounterState(
      counterValue: state.counterValue - 1, isIncremented: false));
}
