
import 'package:allinone/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitView extends StatelessWidget {
  const CounterCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Cubit'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Wrap(
            direction: Axis.vertical,
            spacing: 8,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().decrement(),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().reset(),
                tooltip: 'Reset',
                child: const Icon(Icons.reset_tv),
              ),
            ],
        ),
    );
  }
}