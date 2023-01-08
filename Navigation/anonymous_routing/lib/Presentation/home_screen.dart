library home_screen;

import 'package:anonymous_routing/Logic/Cubit/Counter%20Cubit/counter_cubit.dart';
import 'package:anonymous_routing/Presentation/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen', style: TextStyle(fontSize: 20)),
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
                    heroTag: 'home_add'),
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
                  heroTag: 'home_remove',
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (secondScreenContext) => BlocProvider.value(
                            value: BlocProvider.of<CounterCubit>(context),
                            child: const SecondScreen(),
                          )));
                },
                child: const Text('Navigate to second page'))
          ],
        ),
      ),
    );
  }
}
