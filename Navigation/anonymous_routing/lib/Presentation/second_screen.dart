library second_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Logic/Cubit/Counter Cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen', style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have to tap on buttons to see the result'),
            const Text('Counter Value', style: TextStyle(fontSize: 33)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    heroTag: 'second_add'),
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    late final SnackBar snackBar;
                    if (state.isIncremented == true) {
                      snackBar = const SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 1),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (state.isIncremented == false) {
                      snackBar = const SnackBar(
                        content: Text('decremented!'),
                        duration: Duration(milliseconds: 1),
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
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  heroTag: 'second_remove',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
