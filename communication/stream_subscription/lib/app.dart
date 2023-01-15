import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_subscription/logic/cubit/counter/counter_cubit.dart';
import 'package:stream_subscription/logic/cubit/network/network_cubit.dart';
import 'package:stream_subscription/presentation/home_page.dart';

class App extends StatelessWidget {
  final Connectivity connectivity;
  const App({super.key, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NetworkCubit(connectivity: connectivity)),
        BlocProvider(
          create: (context) => CounterCubit(
              networkCubit: BlocProvider.of<NetworkCubit>(context)),
        )
      ],
      child: MaterialApp(
        title: 'stream subscription',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        home: HomePage(),
      ),
    );
  }
}
