import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:named_routing/logic/cubit/counter_cubit.dart';
import 'package:named_routing/presentation/screen/home_screen.dart';
import 'package:named_routing/presentation/screen/second_screen.dart';
import 'package:named_routing/presentation/screen/third_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routing',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(themeColor: Colors.orange),
            ),
        '/second': (context) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(themeColor: Colors.green)),
        '/third': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(
              themeColor: Colors.brown,
            )),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
