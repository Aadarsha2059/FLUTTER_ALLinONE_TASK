

import 'package:allinone/cubit/student_cubit.dart';
import 'package:allinone/view/student_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student BLoC',
      home: BlocProvider(
        create: (context) => StudentCubit(),
        child:StudentCubitView (),
      ),
    );
  }
}
