

import 'package:allinone/cubit/arithmetic_cubit.dart';
import 'package:allinone/cubit/counter_cubit.dart';
import 'package:allinone/cubit/student_cubit.dart';
import 'package:allinone/view/arithmetic_cubit_view.dart';
import 'package:allinone/view/counter_cubit_view.dart';
import 'package:allinone/view/student_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  final ArithmeticCubit arithmeticCubit;
  final StudentCubit studentCubit;
  final CounterCubit counterCubit;

  DashboardCubit({
    required this.arithmeticCubit,
    required this.studentCubit,
    required this.counterCubit,
  }) : super(null);

  void onArithmeticCubitTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: arithmeticCubit,
          child: ArithmeticCubitView(),
        ),
      ),
    );
  }

  void onCounterCubitTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: counterCubit,
          child: const CounterCubitView(),
        ),
      ),
    );
  }

  void onStudentCubitTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: studentCubit,
          child: StudentCubitView(),
        ),
      ),
    );
  }
}
