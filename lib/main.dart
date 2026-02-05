import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigastore/features/auth/forgot_password_screen.dart';
import 'package:gigastore/features/auth/login/login_screen.dart';
import 'package:gigastore/features/auth/sign_up/signup_screen.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_routes.dart';
import 'features/splash/splash_screen.dart';
import 'features/home/home_screen.dart';
import 'features/home/cubit/home_cubit.dart';
import 'data/repositories/product_repository.dart';
import 'data/services/api_service.dart';
import 'package:gigastore/features/cart/cubit/cart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(
            ProductRepository(
              ApiService(),
            ),
          ),
        ),
         BlocProvider<CartCubit>(
          create: (_) => CartCubit(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (_) => const SplashScreen(),
          AppRoutes.login: (_) => const LoginScreen(),
  AppRoutes.signup: (_) => const SignUpScreen(),
  AppRoutes.forgot: (_) => const ForgotPasswordScreen(),
          AppRoutes.home: (_) => const HomeScreen(),
        },
      ),
    );
  }
}
