import 'package:flutter/material.dart';
import 'package:fetch_bloc/presentation/screen/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/bloc/bloc/fetch_observer.dart';

void main(List<String> args) {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fetch network data',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
