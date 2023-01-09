library generated_route;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generated_route/Logic/Cubit/counter_cubit.dart';
import 'package:generated_route/Presentation/Screen/home_screen.dart';
import 'package:generated_route/Presentation/Screen/second_screen.dart';
import 'package:generated_route/Presentation/Screen/third_screen.dart';

class GeneratedRoute {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(title: 'Home Screen', theme: Colors.orange),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child:
                const SecondScreen(title: 'Second Screen', theme: Colors.green),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child:
                const ThirdScreen(title: 'Third Screen', theme: Colors.brown),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
