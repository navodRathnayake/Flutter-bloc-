library third_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generated_route/Logic/Cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  final String title;
  final Color theme;
  const ThirdScreen({super.key, required this.title, required this.theme});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext thirdContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 20)),
        backgroundColor: widget.theme,
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (thirdContext, state) {
          listener:
          (thirdContext, state) {
            final SnackBar snackBar;
            if (state.isIncremented == true) {
              snackBar = const SnackBar(
                content: Text('Incremented'),
                duration: Duration(milliseconds: 4),
              );
              ScaffoldMessenger.of(thirdContext).showSnackBar(snackBar);
            } else if (state.isIncremented == false) {
              snackBar = const SnackBar(
                content: Text('Decremented'),
                duration: Duration(milliseconds: 4),
              );
              ScaffoldMessenger.of(thirdContext).showSnackBar(snackBar);
            }
          };
        },
        child: SafeArea(
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
                      BlocProvider.of<CounterCubit>(thirdContext).increment();
                    },
                    heroTag: 'home_add',
                    backgroundColor: widget.theme,
                    child: const Icon(Icons.add),
                  ),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (thirdContext, state) {
                      return Text(
                        state.counter.toString(),
                        style: const TextStyle(fontSize: 33),
                      );
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(thirdContext).decrement();
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
      ),
    );
  }
}
