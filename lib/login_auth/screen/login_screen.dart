import 'dart:developer';

import 'package:bloc_demo/login_auth/bloc/login_auth_bloc.dart';
import 'package:bloc_demo/login_auth/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../comman/base_card.dart';
import '../../comman/color_constants.dart';
import '../../comman/textfieldwidget.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(),
      _userIdController = TextEditingController(),
      _passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: addText('login'.toUpperCase(), 25, ColorConstants.primaryColor,
            FontWeight.w500,
            isRight: false,
            width: MediaQuery.of(context).size.width,
            fontFamily: 'TwCen',
            isCenter: true),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                  child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          containerDivider(width: 20.0),
                        ],
                      ),
                      spaceHeight(25),
                      addText('E-Mail ID', 14, ColorConstants.primaryColor,
                          FontWeight.w500,
                          isRight: false, width: 100),
                      spaceHeight(10),
                      TextFieldWidget(
                        height: 45,
                        borderWidth: 0.5,
                        controller: _userIdController,
                        borderColor: ColorConstants.white,
                        inputAction: TextInputAction.next,
                        sufficIcon: const Icon(Icons.person,
                            color: ColorConstants.primaryColor),
                      ),
                      spaceHeight(22),
                      addText('Password', 14, ColorConstants.primaryColor,
                          FontWeight.w500,
                          isRight: false, width: 100),
                      spaceHeight(10),
                      TextFieldWidget(
                        height: 45,
                        borderWidth: 0.5,
                        controller: _passwordController,
                        borderColor: ColorConstants.white,
                        isVisible: isVisible,
                        inputAction: TextInputAction.done,
                        sufficIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                            log('isVisible... $isVisible');
                          },
                          child: Icon(
                              isVisible
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye,
                              color: ColorConstants.primaryColor),
                        ),
                        // validationMessage: 'Adksf',
                      ),
                      spaceHeight(22),
                      StreamBuilder(
                          stream: context.read<AuthBloc>().stream,
                          builder: (context, snapshot) {
                            print(state is CheckBoxValue);
                            if (state is CheckBoxValue) {
                              return Checkbox(
                                  value: state.checkValue,
                                  onChanged: (bool? val) {
                                    print('Check Box Click ---> $val');
                                    context.read<AuthBloc>().add(
                                        CheckBoxUpdate(checkBoxValue: val!));
                                  });
                            }
                            return Checkbox(
                                value: false,
                                onChanged: (bool? val) {
                                  print('Check Box Click ---> $val');
                                  context
                                      .read<AuthBloc>()
                                      .add(CheckBoxUpdate(checkBoxValue: val!));
                                });
                          }),
                      spaceHeight(5),
                      baseCardShadow(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          borderWidth: 3,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(LoginAuthCreate(
                                  emailId: _userIdController.text.trim(),
                                  password: _passwordController.text.trim(),
                              ));
                            }
                            // login(context);
                            // Get.offAllNamed(Routes.dashboardView);
                          },
                          containerFirst: ColorConstants.primaryColor,
                          containerThird: ColorConstants.primaryColor,
                          borderSecond: ColorConstants.primaryColor,
                          gradientFirst: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ColorConstants.startColor,
                                ColorConstants.endColor
                              ]),
                          gradientSecond: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ColorConstants.startColor,
                                ColorConstants.endColor
                              ]),
                          gradientThird: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ColorConstants.startColor,
                                ColorConstants.endColor
                              ]),
                          borderColorThird: ColorConstants.primaryColor,
                          borderWidthThird: 3.0,
                          topLeftRadius: 15,
                          topRightRadius: 15,
                          bottomLeftRadius: 15,
                          bottomRightRadius: 15,
                          child: addText('login', 20, ColorConstants.white,
                              FontWeight.w600)),
                      spaceHeight(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          navigationWidget(
                              onTap: () {
                                print('On Tap');
                                // Get.offAllNamed(Routes.registerView);
                              },
                              firstText: 'Don\'t have an account ',
                              secondText: 'Register Now',
                              toUpper: false,
                              isTextAlign: TextAlign.end,
                              firstStyle: const TextStyle(
                                  color: ColorConstants.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.0),
                              secondStyle: const TextStyle(
                                  color: ColorConstants.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.0)),
                        ],
                      ),
                      spaceHeight(35),
                      // navigationWidget(
                      //     onTap: () {},//=> Get.toNamed(Routes.forgetPasswordView),
                      //     firstText: '',
                      //     secondText: 'Forget Password',
                      //     toUpper: false,
                      //     secondStyle: GoogleFonts.poppins(
                      //       color: ColorConstants.primaryColor,
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w500,
                      //       letterSpacing: 1.0,
                      //     )),
                      // containerDivider(
                      //     width: 45.0, color: ColorConstants.primaryColor, height: 0.5),
                    ],
                  ),
                ),
              )),
              if (state is AuthLoader) ...{
                IgnorePointer(
                    ignoring: false,
                    child: Container(
                      color: Colors.white24,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.cyanAccent,
                      )),
                    ))
              }
            ],
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                showCloseIcon: true,
                duration: const Duration(seconds: 1),
                dismissDirection: DismissDirection.up,
                content: Text(
                  state.error,
                ),
              ),
            );
          }
          if (state is AuthSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AuthHomeScreen()));
          }
        },
      ),
    );
  }
}
