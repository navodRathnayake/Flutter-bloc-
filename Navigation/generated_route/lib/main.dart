import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generated_route/Logic/Cubit/counter_cubit.dart';
import 'package:generated_route/Presentation/Route/generated_route.dart';
import 'package:generated_route/Presentation/Screen/home_screen.dart';
import 'package:generated_route/Presentation/Screen/second_screen.dart';
import 'package:generated_route/Presentation/Screen/third_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GeneratedRoute _appRoute = GeneratedRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated Route',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      onGenerateRoute: _appRoute.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRoute.dispose();
    super.dispose();
  }
}
