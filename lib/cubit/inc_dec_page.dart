import 'package:bloc_demo/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Inc Dec Page'),
        ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterIncremented());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 5),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterDecrement());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.minimize),
              )
            ]));
  }
}
