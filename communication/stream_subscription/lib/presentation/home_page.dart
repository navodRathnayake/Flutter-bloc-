library home_page.dart;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_subscription/logic/cubit/counter/counter_cubit.dart';
import 'package:stream_subscription/logic/cubit/network/network_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<NetworkCubit, NetworkState>(
              builder: (context, state) {
                if (state is NetworkConnected &&
                    state.status == NetworkStatus.wifi) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wifi, size: 50),
                      const Text('Wifi'),
                      Text(BlocProvider.of<CounterCubit>(context)
                          .state
                          .counter
                          .toString()),
                    ],
                  );
                } else if (state is NetworkConnected &&
                    state.status == NetworkStatus.mobile) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lte_mobiledata, size: 50),
                      const Text('Mobile data'),
                      Text(BlocProvider.of<CounterCubit>(context)
                          .state
                          .counter
                          .toString()),
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.mobiledata_off_sharp, size: 50),
                    const Text('Disconnected'),
                    Text(BlocProvider.of<CounterCubit>(context)
                        .state
                        .counter
                        .toString()),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
