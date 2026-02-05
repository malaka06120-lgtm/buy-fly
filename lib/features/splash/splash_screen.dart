import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gigastore/core/constants/colors.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.login,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // LOGO
            Icon(
              Icons.local_mall,
              color: Colors.white,
              size: 90,
            ),

            const SizedBox(height: 20),

            // APP NAME
            const Text(
              'Buy & Fly',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Click. Shop. Shine',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),

            /// Loading
            SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                color: AppColors.primary,     
                backgroundColor: AppColors.lightGray,
                minHeight: 6,
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
