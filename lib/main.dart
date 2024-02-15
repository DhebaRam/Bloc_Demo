import 'package:bloc_demo/cubit/counter_bloc.dart';
import 'package:bloc_demo/cubit/counter_cubit.dart';
import 'package:bloc_demo/login_auth/screen/login_screen.dart';
import 'package:bloc_demo/todo_app/to_do_cudit_cubit.dart';
import 'package:bloc_demo/weather_app/data_provider/weather_data_provider.dart';
import 'package:bloc_demo/weather_app/repository/weather_repository.dart';
import 'package:bloc_demo/weather_app/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_demo_color/bloc/color_bloc.dart';
import 'login_auth/auth_provider/auth_provider.dart';
import 'login_auth/bloc/login_auth_bloc.dart';
import 'login_auth/repository/auth_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return RepositoryProvider(
    //   create: (context) => WeatherRepository(
    //     WeatherDataProvider(),
    //   ),
    //   child: MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //         create: (context) => WeatherBloc(
    //           context.read<WeatherRepository>(),
    //         ),
    //       ),
    //     ],
    //     child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData.dark(useMaterial3: true),
    //       home: const WeatherHome(),
    //     ),
    //   ),
    // );
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => WeatherRepository(WeatherDataProvider())),
        RepositoryProvider(
            create: (context) => AuthRepository(AuthDataProvider())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  WeatherBloc(context.read<WeatherRepository>())),
          BlocProvider(create: (_) => CounterCubit()),
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => ToDoCubit()),
          // BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(create: (_) => ColorBloc()),
          BlocProvider(
              create: (context) =>
                  AuthBloc(context.read<AuthRepository>()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Bloc',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          // home: const BlocColorHomeScreen(),
          // home: const WeatherHome(),
          // home: const LoginScreen(),
          // home: const ToDoHome(),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
