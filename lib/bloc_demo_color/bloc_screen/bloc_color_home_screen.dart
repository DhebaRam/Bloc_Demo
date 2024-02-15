import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/color_bloc.dart';

class BlocColorHomeScreen extends StatefulWidget {
  const BlocColorHomeScreen({super.key});

  @override
  State<BlocColorHomeScreen> createState() => _BlocColorHomeScreenState();
}

class _BlocColorHomeScreenState extends State<BlocColorHomeScreen> {
  Color color = Colors.red;
  final redController = TextEditingController(),
      greenController = TextEditingController(),
      blueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white70,
            titleSpacing: 0.5,
            centerTitle: true,
            title: GradientText('Color Change',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple),
                gradient: const LinearGradient(colors: [
                  Colors.red,
                  Colors.pink,
                  Colors.purple,
                  Colors.deepPurple,
                  Colors.deepPurple,
                  Colors.indigo,
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.cyan,
                  Colors.teal,
                  Colors.green,
                  Colors.lightGreen,
                  Colors.lime,
                  Colors.yellow,
                  Colors.amber,
                  Colors.orange,
                  Colors.deepOrange,
                ]))),
        body: Center(
            child: SingleChildScrollView(
                child: BlocConsumer<ColorBloc, ColorState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  TextField(
                    controller: redController,keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, NumericRangeFormatter(0, 255)],
                    decoration: const InputDecoration(
                      labelText: 'Enter a value (0 - 255)',
                        hintText: 'Red Color Value between 0 < 256'),
                  ),
                  TextField(
                    controller: greenController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, NumericRangeFormatter(0, 255)],
                    decoration: const InputDecoration(
                        labelText: 'Enter a value (0 - 255)',
                        hintText: 'Green Color Value between 0 < 256'),
                  ),
                  TextField(
                    controller: blueController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, NumericRangeFormatter(0, 255)],
                    decoration: const InputDecoration(
                        labelText: 'Enter a value (0 - 255)',
                        hintText: 'Blue Color Value between 0 < 256'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: (state as SuccessFullChange).newColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        //   Random random = Random();
                        //   color = Color.fromRGBO(
                        //     random.nextInt(256),
                        //     random.nextInt(256),
                        //     random.nextInt(256),
                        //     1.0,
                        //   );
                        //   print(color.red);
                        // });

                        context.read<ColorBloc>().add(ColorChange(
                            red: int.parse(redController.text.trim().isEmpty ? '1' : redController.text.trim()),
                            green: int.parse(greenController.text.trim().isEmpty ? '1' : greenController.text.trim()),
                            blue: int.parse(blueController.text.trim().isEmpty ? '1' : blueController.text.trim())));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text('Color Change',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 22))
                      ))
                ]));
          },
        ))));
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class NumericRangeFormatter extends TextInputFormatter {
  final int minValue;
  final int maxValue;

  NumericRangeFormatter(this.minValue, this.maxValue);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      int enteredValue = int.tryParse(newValue.text) ?? 0;
      if (enteredValue < minValue) {
        return TextEditingValue(
          text: minValue.toString(),
          selection: TextSelection.collapsed(offset: minValue.toString().length),
        );
      } else if (enteredValue > maxValue) {
        return TextEditingValue(
          text: maxValue.toString(),
          selection: TextSelection.collapsed(offset: maxValue.toString().length),
        );
      }
    }
    return newValue;
  }
}
