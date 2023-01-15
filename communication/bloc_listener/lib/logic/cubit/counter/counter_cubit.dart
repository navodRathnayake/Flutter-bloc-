import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stream_subscription/logic/cubit/network/network_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final NetworkCubit networkCubit;
  late StreamSubscription networkSubscription;
  CounterCubit({required this.networkCubit})
      : super(const CounterInitial(counter: 0)) {
    monitorNetworkSubscription();
  }

  void increment() => emit(CounterIncrement(counter: state.counter + 1));

  void decrement() => emit(CounterDecrement(counter: state.counter - 1));

  StreamSubscription<NetworkState> monitorNetworkSubscription() {
    return networkSubscription = networkCubit.stream.listen((internetState) {
      if (internetState is NetworkConnected &&
          internetState.status == NetworkStatus.wifi) {
        increment();
      } else if (internetState is NetworkConnected &&
          internetState.status == NetworkStatus.mobile) {
        decrement();
      }
    });
  }

  @override
  Future<void> close() {
    networkSubscription.cancel();
    return super.close();
  }
}
