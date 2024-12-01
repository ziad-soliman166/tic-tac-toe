import 'package:flutter/material.dart';
import 'package:tic_tac_toe/routes_manager/routes_manager.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        RoutesManager.GameScreen: (_) => GameScreen(),
        RoutesManager.SplashScreen: (_) => SplashScreen(),
      },
      initialRoute: RoutesManager.SplashScreen, // Start with the splash screen
    );
  }
}
