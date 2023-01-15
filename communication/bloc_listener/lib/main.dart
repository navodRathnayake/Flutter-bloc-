import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:stream_subscription/app.dart';

void main(List<String> args) {
  Connectivity connectivity = Connectivity();
  runApp(App(
    connectivity: connectivity,
  ));
}
