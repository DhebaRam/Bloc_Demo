import 'package:bloc_demo/login_auth/bloc/login_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHomeScreen extends StatefulWidget {
  const AuthHomeScreen({super.key});

  @override
  State<AuthHomeScreen> createState() => _AuthHomeScreenState();
}

class _AuthHomeScreenState extends State<AuthHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (BuildContext context, AuthState state) {
                print('Current Listener State ----- > ${state is AuthBloc}');
              },
              builder: (BuildContext context, AuthState state) {
                if (state is AuthFailed) {
                  return Container(
                    color: Colors.white24,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text(state.error)),
                  );
                }
                if (state is AuthSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.userData.email}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${state.userData.pwd}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${state.userData.name}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${state.userData.address}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${state.userData.mobile}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                    ],
                  );
                }
                return IgnorePointer(
                    ignoring: false,
                    child: Container(
                      color: Colors.white24,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.cyanAccent,
                      )),
                    ));
              },
            ),
          )),
    );
  }
}
