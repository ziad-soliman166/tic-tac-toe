import 'package:flutter/material.dart';
import 'package:tic_tac_toe/assets_manager/assets_manager.dart';

import '../routes_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToGameScreen();
  }

  void _navigateToGameScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RoutesManager.GameScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetsManager.splashScreen3,
          fit: BoxFit.fill,
          height: double.infinity, // Ensure the path is correct
        ),
      ),
    );
  }
}
