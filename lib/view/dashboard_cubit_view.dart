// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:allinone/cubit/arithmetic_cubit.dart';
import 'package:allinone/view/arithmetic_cubit_view.dart';
import 'package:allinone/cubit/counter_cubit.dart';
import 'package:allinone/view/counter_cubit_view.dart';
import 'package:allinone/cubit/student_cubit.dart';
import 'package:allinone/view/student_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// DashboardCubit manages navigation to different Cubit views
class DashboardCubit extends Cubit<void> {
  final ArithmeticCubit arithmeticCubit;
  final StudentCubit studentCubit;
  final CounterCubit counterCubit;

  DashboardCubit(
    this.arithmeticCubit,
    this.studentCubit,
    this.counterCubit,
  ) : super(null);

  void onArithmeticCubitTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: arithmeticCubit,
          child:  ArithmeticCubitView(),
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
          child:  StudentCubitView(),
        ),
      ),
    );
  }
}

/// DashboardView displays three operation cards and navigates to respective views
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArithmeticCubit>(create: (_) => ArithmeticCubit()),
        BlocProvider<StudentCubit>(create: (_) => StudentCubit()),
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit(
            context.read<ArithmeticCubit>(),
            context.read<StudentCubit>(),
            context.read<CounterCubit>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Dashboard'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: [
                  operationCard(
                    title: 'Counter',
                    onTap: () => context.read<DashboardCubit>().onCounterCubitTap(context),
                  ),
                  operationCard(
                    title: 'Arithmetic Operations',
                    onTap: () => context.read<DashboardCubit>().onArithmeticCubitTap(context),
                  ),
                  operationCard(
                    title: 'Student List',
                    onTap: () => context.read<DashboardCubit>().onStudentCubitTap(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// A reusable styled card for dashboard operations
  Widget operationCard({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
