import 'package:flutter/material.dart';
import 'package:zapatas/menuView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(InitializationApp());
}

class InitializationApp extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<InitializationApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuView(),
    );
  }
}
