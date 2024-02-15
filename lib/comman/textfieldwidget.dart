import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'color_constants.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  final String hintText;
  String? validationMessage;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword, isEmail;
  BorderRadius? borderRadius;
  double? height, minHeight, maxHeight;
  void Function(String)? onChanged;
  final Function? onSubmit;
  final VoidCallback? onTap;
  void Function(String)? onFieldSubmitted;

  // final String labelText;
  final bool isEnabled;
  Color? fillColor;
  Color? hintColor;
  Color? borderColor;
  bool? readOnly, isVisible = false, onFieldSubmittedTap = false;
  final int maxLines;
  double? fontsize;
  double? borderWidth;
  Widget? sufficIcon;

  // final Color color;
  final TextCapitalization capitalization;
  final bool isIcon;
  Widget? prefixIcon;
  final bool isNumber;
  final bool divider;
  int? maxLength;

  TextFieldWidget({
    super.key,
    this.hintText = '',
    this.controller,
    this.hintColor,
    this.focusNode,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.nextFocus,
    this.fontsize,
    this.fillColor,
    this.height,
    this.minHeight,
    this.maxHeight,
    // this.color,
    // required this.labelText,
    this.isEnabled = true,
    this.isEmail = false,
    this.readOnly,
    this.isVisible,
    this.sufficIcon,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onTap,
    this.onChanged,
    this.isIcon = false,
    this.isNumber = false,
    this.prefixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.divider = false,
    this.validationMessage = '',
    this.onFieldSubmittedTap = false,
    this.onFieldSubmitted,
    this.maxLength
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(
        //     color: widget.fillColor ?? ColorConstants.textFieldBG,
        //     border: Border.all(
        //         width: widget.borderWidth ?? 0,
        //         color: widget.borderColor ?? ColorConstants.textFieldBG),
        //     borderRadius: widget.borderRadius ?? BorderRadius.circular(10)),
        // // height: widget.height ?? 45,
        constraints: BoxConstraints(
            minHeight: widget.minHeight ?? 45,
            maxHeight: widget.maxHeight ?? 80),
        child: TextFormField(
            readOnly: widget.readOnly ?? false,
            onChanged: widget.onChanged,
            textAlign: TextAlign.start,
            autofocus: false,
            obscureText: widget.isVisible ?? false,
            cursorColor: ColorConstants.grey,
            minLines: widget.maxLines,
            enabled: true,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            style: GoogleFonts.workSans(
                color: ColorConstants.white,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
            onEditingComplete: () {
              // FocusScope.of(context).unfocus();
              // _fPassword.requestFocus();
            },
            onFieldSubmitted: widget.onFieldSubmitted ??
                (Platform.isIOS
                    ? (s) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    : widget.onFieldSubmittedTap!
                        ? (s) {
                            print('Outside click...');
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        : null),
            onTap: widget.onTap,
            validator: (value) {
              if (value!.isEmpty) {
                return '';
              } else {
                const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                    r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                final regex = RegExp(pattern);
                if (widget.isEmail && value.isNotEmpty && !regex.hasMatch(value)) {
                  return widget.validationMessage;
                } else {
                  null;
                }
              }
            },
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
                filled: true,
                fillColor: widget.fillColor ?? ColorConstants.textFieldBG,
                suffixIcon: widget.sufficIcon,
                prefixIcon: widget.prefixIcon,
                hintText: widget.hintText,
                hintStyle: GoogleFonts.workSans(
                    color: widget.hintColor ?? ColorConstants.grey,
                    fontSize: widget.fontsize ?? 15,
                    fontWeight: FontWeight.w500),
                contentPadding: EdgeInsetsDirectional.only(
                    start: widget.isIcon ? 0 : 20, end: 5, top: 10.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            widget.borderColor ?? ColorConstants.textFieldBG),
                    borderRadius: widget.borderRadius ??
                        const BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            widget.borderColor ?? ColorConstants.textFieldBG),
                    borderRadius: widget.borderRadius ??
                        const BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            widget.borderColor ?? ColorConstants.textFieldBG),
                    borderRadius: widget.borderRadius ??
                        const BorderRadius.all(Radius.circular(10))),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: widget.borderWidth ?? 0,
                        style: BorderStyle.solid),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10))))));
  }
}
