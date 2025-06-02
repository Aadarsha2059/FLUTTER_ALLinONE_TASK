
import 'package:allinone/cubit/arithmetic_cubit.dart';
import 'package:allinone/cubit/counter_cubit.dart';
import 'package:allinone/cubit/dashboard_cubit.dart';
import 'package:allinone/cubit/student_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
}

void _initBloc() {
  serviceLocator.registerFactory<CounterCubit>(() => CounterCubit());
  serviceLocator.registerFactory<ArithmeticCubit>(() => ArithmeticCubit());
  serviceLocator.registerFactory<StudentCubit>(() => StudentCubit());

  serviceLocator.registerLazySingleton<DashboardCubit>(
    () => DashboardCubit(
      arithmeticCubit: serviceLocator(),
      studentCubit: serviceLocator(),
      counterCubit: serviceLocator(),
    ),
  );
}
