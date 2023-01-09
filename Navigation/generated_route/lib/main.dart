import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generated_route/Logic/Cubit/counter_cubit.dart';
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
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated Route',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child:
                  const HomeScreen(title: 'Home Screen', theme: Colors.brown),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(
                  title: 'Second Screen', theme: Colors.green),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                  title: 'Third Screen', theme: Colors.orange),
            )
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
