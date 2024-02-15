import 'package:flutter/material.dart';

import 'color_constants.dart';


Widget baseCard(
    {VoidCallback? onTap,
    Widget child = const SizedBox(),
    double borderRadius = 25,
    Color? color,
    Color? firstColor,
    Color? secondColor,
    Color? firstColor1,
    Color? secondColor1,
    Color? borderColor,
    double? height,
    double? width,
    double firstContainerLeftPadding = 5.0,
    double firstContainerRightPadding = 5.0,
    double firstContainerTopPadding = 5.0,
    double firstContainerBottomPadding = 5.0,
    bool transparent = false,
    Gradient? gradient,
    Gradient? gradientSecond,
    double? borderWidth,
    topPadding,
    rightPadding,
    bottomPadding,
    leftPadding}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(
          left: firstContainerLeftPadding,
          right: firstContainerRightPadding,
          top: firstContainerTopPadding,
          bottom: firstContainerBottomPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient ??
              LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    firstColor ?? ColorConstants.startColor,
                    secondColor ?? ColorConstants.endColor
                  ])),
      child: Container(
        clipBehavior: Clip.none,
        width: width,
        height: height,
        padding: EdgeInsets.only(
            top: topPadding ?? 0,
            right: rightPadding ?? 0,
            bottom: bottomPadding ?? 0,
            left: leftPadding ?? 0),
        decoration: BoxDecoration(
          color:
              transparent ? Colors.transparent : color ?? ColorConstants.black,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 3,
          ),
          gradient: gradientSecond ??
              LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    firstColor1 ?? ColorConstants.black,
                    secondColor1 ?? ColorConstants.black
                  ]),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    ),
  );
}

Widget baseCardShadow(
    {VoidCallback? onTap,
    Widget child = const SizedBox(),
    double topLeftRadius = 10,
    double topRightRadius = 10,
    double bottomLeftRadius = 10,
    double bottomRightRadius = 10,
    Color? color,
    Color? containerFirst,
    Color? containerThird,
    Gradient? gradientFirst,
    Gradient? gradientSecond,
    Gradient? gradientThird,
    Color? borderColor,
    Color? borderSecond,
    Color? borderColorThird,
    double? borderWidthThird,
    Color? borderTopColorSecond,
    Color? borderRightColorSecond,
    Color? borderLeftColorSecond,
    Color? borderBottomColorSecond,
    double? height,
    double? width,
    double? borderWidth,
    double? borderTopWidthSecond,
    double? borderRightWidthSecond,
    double? borderLeftWidthSecond,
    double? borderBottomWidthSecond,
    double? secondLeft,
    double? firstBottomMargin,
    double? firstBottomPadding,
    secondRight,
    secondTop,
    secondBottom}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(bottom: firstBottomMargin ?? 0),
      padding: EdgeInsets.only(top: 0.0, bottom: firstBottomPadding ?? 3.0),
      decoration: BoxDecoration(
          color: containerFirst ?? ColorConstants.grayShadow,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius),
              topRight: Radius.circular(topRightRadius),
              bottomLeft: Radius.circular(bottomLeftRadius),
              bottomRight: Radius.circular(bottomRightRadius)),
          gradient: gradientFirst ??
              const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorConstants.grayShadow,
                    ColorConstants.grayShadow
                  ])),
      child: Container(
        clipBehavior: Clip.none,
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradientSecond ??
              const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [ColorConstants.startGray, ColorConstants.endGray]),
          border: Border(
              top: BorderSide(
                  color: borderTopColorSecond ?? Colors.transparent,
                  width: borderTopWidthSecond ?? 0),
              bottom: BorderSide(
                  color: borderBottomColorSecond ?? Colors.transparent,
                  width: borderBottomWidthSecond ?? 0),
              left: BorderSide(
                  color: borderLeftColorSecond ?? Colors.transparent,
                  width: borderLeftWidthSecond ?? 0),
              right: BorderSide(
                  color: borderRightColorSecond ?? Colors.transparent,
                  width: borderRightWidthSecond ?? 0)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius),
              topRight: Radius.circular(topRightRadius),
              bottomLeft: Radius.circular(bottomLeftRadius),
              bottomRight: Radius.circular(bottomRightRadius)),
        ),
        child: Container(
            padding: EdgeInsets.only(
                left: secondLeft ?? 0,
                right: secondRight ?? 0,
                top: secondTop ?? 0,
                bottom: secondBottom ?? 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: containerThird ?? ColorConstants.textFieldBG,
              border: Border.all(
                color: borderColorThird ?? Colors.transparent,
                width: borderWidthThird ?? 3,
              ),
              gradient: gradientThird ??
                  const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorConstants.textFieldBG,
                        ColorConstants.textFieldBG
                      ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius),
                  topRight: Radius.circular(topRightRadius),
                  bottomLeft: Radius.circular(bottomLeftRadius),
                  bottomRight: Radius.circular(bottomRightRadius)),
            ),
            child: Container(child: child)),
      ),
    ),
  );
}
