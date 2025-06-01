import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit to manage arithmetic operations.
class ArithmeticCubit extends Cubit<int> {
  ArithmeticCubit() : super(0);

  void add(int a, int b) => emit(a + b);

  void subtract(int a, int b) => emit(a - b);

  void multiply(int a, int b) => emit(a * b);
}
