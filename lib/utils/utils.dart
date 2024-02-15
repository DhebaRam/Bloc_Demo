import 'package:bloc_demo/utils/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../comman/color_constants.dart';


Widget spaceHeight(double height) {
  return SizedBox(height: height);
}

Widget spaceScreenHeight(double height) {
  return SizedBox(height: height.h);
}

Widget spaceScreenWidth(double width) {
  return SizedBox(width: width.w);
}

Widget spaceWidth(double height) {
  return SizedBox(width: height.sp);
}

BorderRadius getCurvedBorderRadius() {
  return BorderRadius.circular(20);
}

Widget buildDivider({Color color = ColorConstants.dividerColor}) {
  return Divider(
    height: 3.h,
    color: color,
  );
}

Widget containerDivider({height, width, color}) {
  return Container(
    height: height ?? 3,
    width: width ?? 0,
    color: color ?? ColorConstants.white,
    alignment: Alignment.centerLeft,
  );
}

Widget addText(String text, double size, Color color, FontWeight fontWeight,
    {bool isCenter = false,
    isCapitalize = false,
    isRight = false,
    double letterSpacing = 0,
    double? width,
    double height = 1.2,
    maxLine = 1,
    fontFamily}) {
  return fontFamily != 'TwCen'
      ? width != null
          ? SizedBox(
              width: width,
              child: Text(
                isCapitalize
                    ? UtilMethods.utilSharedInstanace.capitalize(text)
                    : text,
                overflow: TextOverflow.ellipsis,
                textAlign: isCenter
                    ? TextAlign.center
                    : isRight
                        ? TextAlign.end
                        : TextAlign.start,
                textScaleFactor: 1,
                maxLines: maxLine,
                style: GoogleFonts.poppins(
                  color: color,
                  fontSize: size,
                  fontWeight: fontWeight,
                  letterSpacing: letterSpacing,
                ),
              ),
            )
          : Text(
              isCapitalize
                  ? UtilMethods.utilSharedInstanace.capitalize(text)
                  : text,
              textAlign: isCenter
                  ? TextAlign.center
                  : isRight
                      ? TextAlign.end
                      : TextAlign.start,
              textScaleFactor: 1,
              style: GoogleFonts.poppins(
                height: height,
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing,
              ),
            )
      : width != null
          ? SizedBox(
              width: width,
              child: Text(
                isCapitalize
                    ? UtilMethods.utilSharedInstanace.capitalize(text)
                    : text,
                overflow: TextOverflow.ellipsis,
                textAlign: isCenter
                    ? TextAlign.center
                    : isRight
                        ? TextAlign.end
                        : TextAlign.start,
                textScaleFactor: 1,
                maxLines: maxLine,
                style: TextStyle(
                  fontFamily: 'TwCen',
                  color: color,
                  fontSize: size,
                  fontWeight: fontWeight,
                  letterSpacing: letterSpacing,
                ),
              ),
            )
          : Text(
              isCapitalize
                  ? UtilMethods.utilSharedInstanace.capitalize(text)
                  : text,
              textAlign: isCenter
                  ? TextAlign.center
                  : isRight
                      ? TextAlign.end
                      : TextAlign.start,
              textScaleFactor: 1,
              style: TextStyle(
                fontFamily: 'TwCen',
                height: height,
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing,
              ),
            );
}

Widget navigationWidget(
    {VoidCallback? onTap,
    String? firstText,
    String? secondText,
    Color color = ColorConstants.white,
    FontWeight fontWeight = FontWeight.w600,
    secondStyle,
    firstStyle,
    bool toUpper = true,
    TextAlign isTextAlign = TextAlign.center,
    letterSpacing = 1.0}) {
  return GestureDetector(
    onTap: onTap,
    child: Text.rich(
      TextSpan(
        style: GoogleFonts.poppins(
          color: color,
          fontSize: 14,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ),
        children: [
          TextSpan(
            text: firstText!,
            style: firstStyle ??
                GoogleFonts.poppins(
                  color: color,
                  fontSize: 14,
                  fontWeight: fontWeight,
                  letterSpacing: letterSpacing,
                ),
          ),
          TextSpan(
            text: toUpper ? secondText! : secondText!,
            style: secondStyle ??
                const TextStyle(
                    color: ColorConstants.primaryColor,
                    fontFamily: 'TwCen',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0),
          ),
        ],
      ),
      textHeightBehavior:
          const TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: isTextAlign,
      softWrap: false,
    ),
  );
}

Text addTextCenter(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text,
      textScaleFactor: 1,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ));
}

Text addTextAgency(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text,
      textScaleFactor: 1,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: 'AgencyFB'));
}

Widget appDetailRow(title, body) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: ColorConstants.white,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(
                text: body,
                style: GoogleFonts.poppins(
                  // fontFamily: 'Arial',
                  fontSize: 12.sp,
                  color: ColorConstants.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget quizQuestionRow(title, body) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Column(
        children: [RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: ColorConstants.questionColor,
                    fontWeight: FontWeight.w700,
                  ))
            ],
          ),
        ),],
      ),
      Flexible(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: body,
                    style: GoogleFonts.poppins(
                      // fontFamily: 'Arial',
                      fontSize: 19.sp,
                      color: ColorConstants.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget appDetailRowBlue(title, body) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: GoogleFonts.workSans(
                    // fontFamily: 'Arial',
                    fontSize: 12.sp,
                    color: ColorConstants.black,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(
                text: body,
                style: GoogleFonts.workSans(
                  // fontFamily: 'Arial',
                  fontSize: 13.sp,
                  color: ColorConstants.primaryColorDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget noRecordAvailable(
    {String? msg,
    double fontSize = 18.0,
    Color color = Colors.white,
    bool isCenter = true}) {
  return isCenter
      ? Center(
          child: Text(
            msg.toString(), //?? translate(Get.context!).no_data_found,
            style: TextStyle(
              fontSize: fontSize.sp, // Change the font size to 20
              color: color, // Change the text color to grey
            ),
          ),
        )
      : Text(
          msg.toString(), // ?? translate(Get.context!).no_data_found,
          style: TextStyle(
            fontSize: fontSize.sp, // Change the font size to 20
            color: color, // Change the text color to grey
          ),
        );
}

Widget noRecordAvailable2(
    {String? msg, double fontSize = 18.0, Color color = Colors.white}) {
  return Container(
    height: 50,
    alignment: Alignment.topCenter,
    child: Text(
      msg.toString(), // ?? translate(Get.context!).no_record_available,
      style: TextStyle(
        fontSize: fontSize.sp, // Change the font size to 20
        color: color, // Change the text color to grey
      ),
    ),
  );
}

Widget appDetailRowBackIcon(title, body, icon) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: title,
                style: GoogleFonts.workSans(
                  // fontFamily: 'Arial',
                  fontSize: 14.sp,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w400,
                )),

            // TextSpan(
            //   text: body,
            //   style: GoogleFonts.workSans(
            //     // fontFamily: 'Arial',
            //     fontSize: 14.sp,
            //     color: ColorConstants.black,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            WidgetSpan(
                child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(body,
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.workSans(
                      // fontFamily: 'Arial',
                      fontSize: 14.sp,
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 2.w, top: 0),
                  child: icon,
                ),
              ],
            ))
          ],
        ),
      ),
    ],
  );
}

Widget appDetailRowFrontIconBlue(icon, title, body) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
                child: Padding(
              padding: EdgeInsetsDirectional.only(start: 2.w),
              child: icon,
            )),
            TextSpan(
                text: title,
                style: GoogleFonts.workSans(
                  // fontFamily: 'Arial',
                  fontSize: 12.sp,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w400,
                )),
            TextSpan(
              text: body,
              style: GoogleFonts.workSans(
                // fontFamily: 'Arial',
                fontSize: 13.sp,
                color: ColorConstants.primaryColorDark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget appDetailRowBackIconBlue(title, body, icon) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: GoogleFonts.workSans(
                    // fontFamily: 'Arial',
                    fontSize: 12.sp,
                    color: ColorConstants.black,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(
                text: body,
                style: GoogleFonts.workSans(
                  // fontFamily: 'Arial',
                  fontSize: 13.sp,
                  color: ColorConstants.primaryColorDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 2.w),
            child: icon,
          ))
    ],
  );
}

Widget appDetailRowBackIconWhite(title, body, icon) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          text: TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: GoogleFonts.workSans(
                    // fontFamily: 'Arial',
                    fontSize: 14.sp,
                    color: ColorConstants.white,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(
                text: body,
                style: GoogleFonts.workSans(
                  // fontFamily: 'Arial',
                  fontSize: 16.sp,
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /*WidgetSpan(
                  child: Padding(
                padding: EdgeInsetsDirectional.only(left: 2.w),
                child: icon,
              ))*/
            ],
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 2.w),
          child: icon,
        ),
      )
    ],
  );
}

Widget appDetailRowWhite(title, body) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Flexible(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: GoogleFonts.workSans(
                    // fontFamily: 'Arial',
                    fontSize: 14.sp,
                    color: ColorConstants.white,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(
                text: body,
                style: GoogleFonts.workSans(
                  // fontFamily: 'Arial',
                  fontSize: 14.sp,
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget appDetailRowWhiteSimple(title, body) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: title,
                style: GoogleFonts.workSans(
                  // fontFamily: 'Arial',
                  fontSize: 12,
                  color: ColorConstants.white,
                  fontWeight: FontWeight.w400,
                )),
            TextSpan(
              text: body,
              style: GoogleFonts.workSans(
                // fontFamily: 'Arial',
                fontSize: 12,
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget appTitalRowBackIconWhite(title, body, icon) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Padding(
        padding: EdgeInsetsDirectional.only(bottom: 2.h),
        child: Text(title,
            style: GoogleFonts.workSans(
              // fontFamily: 'Arial',
              fontSize: 16,
              color: ColorConstants.white,
              fontWeight: FontWeight.w400,
            )),
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(bottom: 2.h),
        child: Text(
          body,
          style: GoogleFonts.workSans(
            // fontFamily: 'Arial',
            fontSize: 16,
            color: ColorConstants.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      icon
      // Flexible(
      //   child: RichText(
      //     text: TextSpan(
      //       children: [
      //         TextSpan(
      //             text: title,
      //             style: GoogleFonts.workSans(
      //               // fontFamily: 'Arial',
      //               fontSize: detailHeadingTs,
      //               color: ColorConstants.white,
      //               fontWeight: FontWeight.w400,
      //             )),
      //         TextSpan(
      //           text: body,
      //           style: GoogleFonts.workSans(
      //             // fontFamily: 'Arial',
      //             fontSize: detailHeadingTs,
      //             color: ColorConstants.white,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         WidgetSpan(child: icon)
      //       ],
      //     ),
      //   ),
      // ),
    ],
  );
}

BoxShadow getBoxShadow() {
  return const BoxShadow(
    color: Colors.black38,
    offset: Offset(
      0.0,
      1.0,
    ),
    blurRadius: 2.0,
    spreadRadius: 0.0,
  );
}