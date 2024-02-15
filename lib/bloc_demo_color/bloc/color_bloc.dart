import 'dart:math';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';

part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(SuccessFullChange(newColor: Colors.lightBlue)) {
    on<ColorChange>(_colorChange);
  }

  void _colorChange(ColorChange colorChange, Emitter<ColorState> emit) {
    int red = colorChange.red;
    int green = colorChange.green;
    int blue = colorChange.blue;
    emit(AuthLoading());
    Random random = Random();
    Color color = Color.fromRGBO(
      red, green, blue,
      // random.nextInt(red),
      // random.nextInt(green),
      // random.nextInt(blue),
      1.0,
    );
    print(color);
    emit(SuccessFullChange(newColor: color));
  }
}
