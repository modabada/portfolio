import 'package:flutter/material.dart';

class FontStyle {
  FontStyle._();

  static const TextStyle textBasic = TextStyle(
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: -0.02,
  );

  // Display FontSize & Height --------------------------------------------//
  static final TextStyle displayXxl = textBasic.copyWith(
    fontSize: 144,
    height: 1.0278, //148.0032
    letterSpacing: -0.04,
  );

  static final TextStyle displayXl = textBasic.copyWith(
    fontSize: 128,
    height: 1.0625, //136
    letterSpacing: -0.04,
  );

  static final TextStyle displayL = textBasic.copyWith(
    fontSize: 112,
    height: 1.0714, //199.9968
  );

  static final TextStyle displayM = textBasic.copyWith(
    fontSize: 96,
    height: 1.0834, //104.0064
  );

  static final TextStyle displayS = textBasic.copyWith(
    fontSize: 84,
    height: 1.0952, //91.9968
  );

  // Heading FontSize & Height --------------------------------------------//
  static final TextStyle headingXxl = textBasic.copyWith(
    fontSize: 56,
    height: 1.1429, //64.0024
  );

  static final TextStyle headingXl = textBasic.copyWith(
    fontSize: 48,
    height: 1.1667, //56.0016
    letterSpacing: -0.03,
  );

  static final TextStyle headingL = textBasic.copyWith(
    fontSize: 40,
    height: 1.2, //48
    letterSpacing: -0.03,
  );

  static final TextStyle headingM = textBasic.copyWith(
    fontSize: 36,
    height: 1.2222, //43.9992
    letterSpacing: -0.03,
  );

  static final TextStyle headingS = textBasic.copyWith(
    fontSize: 32,
    height: 1.25, //40
    letterSpacing: -0.03,
  );

  // Label FontSize & Height ----------------------------------------------//
  static final TextStyle labelXxl = textBasic.copyWith(
    fontSize: 20,
    height: 1.4, //28
  );

  static final TextStyle labelXl = textBasic.copyWith(
    fontSize: 18,
    height: 1.4444, //25.9992
  );

  static final TextStyle labelL = textBasic.copyWith(
    fontSize: 16,
    height: 1.5, //24
  );

  static final TextStyle labelM = textBasic.copyWith(
    fontSize: 14,
    height: 1.5714, //21.9996
  );

  static final TextStyle labelS = textBasic.copyWith(
    fontSize: 12,
    height: 1.6666, //19.9992
    letterSpacing: -0.01,
  );

  // Display FontWeight ---------------------------------------------------//
  static final TextStyle displayXxl400 = displayXxl.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle displayXxl500 = displayXxl.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle displayXxl700 = displayXxl.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle displayXl400 = displayXl.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle displayXl500 = displayXl.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle displayXl700 = displayXl.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle displayL400 = displayL.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle displayL500 = displayL.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle displayL700 = displayL.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle displayM400 = displayM.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle displayM500 = displayM.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle displayM700 = displayM.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle displayS400 = displayS.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle displayS500 = displayS.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle displayS700 = displayS.copyWith(
    fontWeight: FontWeight.w700,
  );

  // Heading FontWeight ---------------------------------------------------//
  static final TextStyle headingXxl400 = headingXxl.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle headingXxl500 = headingXxl.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle headingXxl700 = headingXxl.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle headingXl400 = headingXl.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle headingXl500 = headingXl.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle headingXl700 = headingXl.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle headingL400 = headingL.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle headingL500 = headingL.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle headingL700 = headingL.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle headingM400 = headingM.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle headingM500 = headingM.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle headingM700 = headingM.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle headingS400 = headingS.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle headingS500 = headingS.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle headingS700 = headingS.copyWith(
    fontWeight: FontWeight.w700,
  );

  // Label FontWeight -----------------------------------------------------//
  static final TextStyle labelXxl400 = labelXxl.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle labelXxl500 = labelXxl.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelXxl700 = labelXxl.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle labelXl400 = labelXl.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle labelXl500 = labelXl.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelXl700 = labelXl.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle labelL400 = labelL.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle labelL500 = labelL.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelL700 = labelL.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle labelM400 = labelM.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle labelM500 = labelM.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelM700 = labelM.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle labelS400 = labelS.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle labelS500 = labelS.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelS700 = labelS.copyWith(
    fontWeight: FontWeight.w700,
  );
}
