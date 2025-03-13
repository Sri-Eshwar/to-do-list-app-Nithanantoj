import 'package:flutter/material.dart';
import 'todo_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper initialization
  runApp(MyApp()); // Removed 'const' from the constructor invocation

}

class MyApp extends StatelessWidget { // Corrected class name


  MyApp({super.key}); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
      ),
      home: const TodoListPage(),
    );
  }
}
