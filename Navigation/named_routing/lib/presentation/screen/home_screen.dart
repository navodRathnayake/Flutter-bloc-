import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:named_routing/logic/cubit/counter_cubit.dart';
import 'package:named_routing/presentation/screen/second_screen.dart';

class HomeScreen extends StatefulWidget {
  final Color themeColor;
  const HomeScreen({super.key, required this.themeColor});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen', style: TextStyle(fontSize: 20)),
        backgroundColor: widget.themeColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You Have to tap the buttons to see the result'),
            const Text('Counter Value', style: TextStyle(fontSize: 33)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  heroTag: 'second_add',
                  backgroundColor: widget.themeColor,
                  child: const Icon(Icons.add),
                ),
                BlocBuilder<CounterCubit, CounterState>(
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
                  heroTag: 'second_remove',
                  backgroundColor: widget.themeColor,
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
        label: const Text('Navigate To Second Page'),
        backgroundColor: widget.themeColor,
        heroTag: 'home_navigation',
      ),
    );
  }
}
