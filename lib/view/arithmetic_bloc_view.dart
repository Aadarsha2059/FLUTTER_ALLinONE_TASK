import 'package:allinone/cubit/arithmetic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 // Make sure import path is correct

class ArithmeticBlocView extends StatefulWidget {
  const ArithmeticBlocView({super.key});

  @override
  State<ArithmeticBlocView> createState() => _ArithmeticBlocViewState();
}

class _ArithmeticBlocViewState extends State<ArithmeticBlocView> {
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArithmeticCubit(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Arithmetic Operations'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _firstController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'First Number'),
                ),
                TextField(
                  controller: _secondController,
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
                        final a = int.tryParse(_firstController.text) ?? 0;
                        final b = int.tryParse(_secondController.text) ?? 0;
                        context.read<ArithmeticCubit>().add(a, b);
                      },
                      child: const Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final a = int.tryParse(_firstController.text) ?? 0;
                        final b = int.tryParse(_secondController.text) ?? 0;
                        context.read<ArithmeticCubit>().subtract(a, b);
                      },
                      child: const Text('Sub'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final a = int.tryParse(_firstController.text) ?? 0;
                        final b = int.tryParse(_secondController.text) ?? 0;
                        context.read<ArithmeticCubit>().multiply(a, b);
                      },
                      child: const Text('Mul'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
