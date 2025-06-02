import 'package:allinone/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:allinone/view/dashboard_cubit_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider.value(
        value: serviceLocator<DashboardCubit>(),
        child: DashboardView(),
      ), 
    );
  }
}
