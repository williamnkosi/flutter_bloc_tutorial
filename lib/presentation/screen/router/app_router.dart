import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_tutorial/presentation/screen/home_screen.dart';
import 'package:flutter_bloc_tutorial/presentation/screen/second_screen.dart';
import 'package:flutter_bloc_tutorial/presentation/screen/third_screen.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => (const HomeScreen(
                title: 'HomeScreen', colors: Colors.blue)));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => (const SecondScreen(
                title: 'SecondScreen', colors: Colors.red)));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => (const ThirdScreen(
                title: 'ThirdScreen', colors: Colors.green)));
      default:
        return MaterialPageRoute(
            builder: (_) => (const HomeScreen(
                title: 'HomeScreen', colors: Colors.blue)));
    }
  }


}
