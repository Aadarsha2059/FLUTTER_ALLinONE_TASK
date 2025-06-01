
import 'package:allinone/cubit/arithmetic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ArithmeticCubitView extends StatelessWidget {
  ArithmeticCubitView({super.key});

  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArithmeticCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Arithmetic Operations'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _firstNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'First Number'),
              ),
              TextField(
                controller: _secondNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Second Number'),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ArithmeticCubit, int>(
                builder: (context, state) {
                  return Text(
                    'Result: $state',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final a = int.tryParse(_firstNumberController.text) ?? 0;
                      final b = int.tryParse(_secondNumberController.text) ?? 0;
                      context.read<ArithmeticCubit>().add(a, b);
                    },
                    child: const Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final a = int.tryParse(_firstNumberController.text) ?? 0;
                      final b = int.tryParse(_secondNumberController.text) ?? 0;
                      context.read<ArithmeticCubit>().subtract(a, b);
                    },
                    child: const Text('Sub'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final a = int.tryParse(_firstNumberController.text) ?? 0;
                      final b = int.tryParse(_secondNumberController.text) ?? 0;
                      context.read<ArithmeticCubit>().multiply(a, b);
                    },
                    child: const Text('Mul'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
