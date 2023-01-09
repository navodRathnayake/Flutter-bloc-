library home_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generated_route/Logic/Cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color theme;
  const HomeScreen({super.key, required this.title, required this.theme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 20)),
        backgroundColor: widget.theme,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have to tap to see the result',
              overflow: TextOverflow.ellipsis,
            ),
            const Text('Counter Value', style: TextStyle(fontSize: 33)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  heroTag: 'home_add',
                  backgroundColor: widget.theme,
                  child: const Icon(Icons.add),
                ),
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    final SnackBar snackBar;
                    if (state.isIncremented == true) {
                      snackBar = const SnackBar(
                        content: Text('Incremented'),
                        duration: Duration(milliseconds: 4),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (state.isIncremented == false) {
                      snackBar = const SnackBar(
                        content: Text('Decremented'),
                        duration: Duration(milliseconds: 4),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state.counter.toString(),
                      style: const TextStyle(fontSize: 33),
                    );
                  },
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  heroTag: 'home_remove',
                  backgroundColor: widget.theme,
                  child: const Icon(Icons.remove),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('/second');
        },
        label: const Text('Navigate to Second Screen'),
        backgroundColor: widget.theme,
        heroTag: 'home_navigation',
      ),
    );
  }
}
