import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:small_test_task_unitpay/cubit/app_cubit.dart';
import 'package:small_test_task_unitpay/pages/home.dart';
import 'package:small_test_task_unitpay/repositories/repository.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  GetIt.instance
    ..registerSingleton<Random>(Random())
    ..registerSingleton<Repository>(Repository())
    ..registerSingleton<AppCubit>(AppCubit()
      ..generateGoods()); //invokes repository`s enormous list generation through cubit
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //pub.dev`s splashscreen
      home: SplashScreenView(
          imageSize: 550,
          duration: 3000,
          imageSrc: 'assets/splash.png',
          navigateRoute: HomePage()),
    );
  }
}
