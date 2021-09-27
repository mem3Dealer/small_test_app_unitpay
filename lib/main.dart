import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:small_test_task_unitpay/app_cubit.dart';
import 'package:small_test_task_unitpay/home.dart';
import 'package:small_test_task_unitpay/repository.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  GetIt.instance
    ..registerSingleton<Random>(Random())
    ..registerSingleton<Repository>(Repository())
    ..registerSingleton<AppCubit>(AppCubit()..generateGoods());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenView(
          imageSize: 550,
          duration: 3000,
          imageSrc: 'assets/splash.png',
          navigateRoute: HomePage()),
    );
  }
}
