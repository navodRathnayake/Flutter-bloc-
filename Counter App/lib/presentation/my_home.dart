library my_home;

import 'package:bloc_counter/logic/Cubit/Counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter App', style: TextStyle(fontSize: 20)),
      ),
      body: BlocListener<CounterCubit, CounterState>(
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have to press the buttons to see the result'),
              const Text('Value', style: TextStyle(fontSize: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      }),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(state.counterValue.toString(),
                          style: const TextStyle(fontSize: 30));
                    },
                  ),
                  FloatingActionButton(
                      child: const Icon(Icons.remove),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
