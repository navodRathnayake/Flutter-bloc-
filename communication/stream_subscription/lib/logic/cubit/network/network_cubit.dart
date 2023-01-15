import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity connectivity;
  StreamSubscription connectivitySubscription;
  NetworkCubit(
      {required this.connectivity, required this.connectivitySubscription})
      : super(NetworkLoading()) {
    listenSubscription();
  }

  void emitInternetConnected({required NetworkStatus status}) =>
      emit(NetworkConnected(status: status)); //

  void emitInternetDisconnected() =>
      emit(NetworkDisconnected(status: NetworkStatus.none));

  void listenSubscription() {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        emitInternetConnected(status: NetworkStatus.wifi);
      } else if (result == ConnectivityResult.mobile) {
        emitInternetConnected(status: NetworkStatus.mobile);
      } else if (result == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }
}
