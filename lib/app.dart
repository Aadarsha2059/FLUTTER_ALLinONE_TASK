import 'package:flutter/material.dart';
import 'package:allinone/view/dashboard_cubit_view.dart'; 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardView(), 
    );
  }
}
