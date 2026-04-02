import 'package:flutter/material.dart';

import 'Pages/login_page.dart';
import 'Pages/register_page.dart';
import 'Pages/loading_page.dart';
import 'Pages/dashboard_page.dart';
import 'Pages/todo_page.dart';
import 'Pages/view_task_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const LoadingScreen(),
        '/login':(context) => const LoginPage(),
        '/register':(context) => const RegisterPage(),
        '/dashboard':(context) => const DashboardPage(),
        '/mytasks':(context) => const TodoPage(),
        '/viewtask':(context) => const ViewTaskPage(),
      },
    );
  }
}
