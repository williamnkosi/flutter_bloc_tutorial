import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_tutorial/presentation/screen/home_screen.dart';
import 'package:flutter_bloc_tutorial/presentation/screen/router/app_router.dart';
import 'package:flutter_bloc_tutorial/presentation/screen/second_screen.dart';
import 'package:flutter_bloc_tutorial/presentation/screen/third_screen.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
   final CounterCubit _counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => _counterCubit,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
