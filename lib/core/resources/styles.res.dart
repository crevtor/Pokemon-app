import 'package:flutter/material.dart';

import 'package:pokemon/core/resources/export.resources.dart';

///This file contains other stylings used in the app
///Asides from font and textStyles

OutlineInputBorder inputBorder(
  Color color, {
  double width = 1,
  Radius radius = xsmallRadius,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      radius,
    ),
    borderSide: BorderSide(
      color: color,
      width: width,
    ),
  );
}

OutlineInputBorder zeroRadiusInputBorder(
  Color color, {
  double width = 1,
}) {
  return inputBorder(
    color,
    width: width,
    radius: zeroRadius,
  );
}


const zeroPadding = EdgeInsets.zero;

const baseViewAllPadding8 = EdgeInsets.all(8);

const baseViewAllPadding16 = EdgeInsets.all(16);

const baseViewAllPadding14 = EdgeInsets.all(14);

const baseViewAllPadding24 = EdgeInsets.all(24);

const baseViewAllPadding2 = EdgeInsets.all(2);

const baseViewAllPadding12 = EdgeInsets.all(12);

const baseViewAllPadding9 = EdgeInsets.all(9);

const baseViewAllPadding1 = EdgeInsets.all(1);

const baseViewAllPadding1_3 = EdgeInsets.all(1.3);

const baseViewPadding1614 = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 14
);


const baseViewPadding0605 = EdgeInsets.symmetric(horizontal: 6, vertical: 5);

const baseViewPadding1416 = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 16
);

const baseViewPadding0805 = EdgeInsets.symmetric(horizontal: 8, vertical: 5);

const baseViewOnlyPadding221816 = EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 16);

const baseViewPadding11 = EdgeInsets.symmetric(
  horizontal: 11,
);

const baseViewPadding14 = EdgeInsets.symmetric(
  horizontal: 14,
);

const baseViewPadding42 = EdgeInsets.symmetric(
  horizontal: 42,
);

const baseViewPadding51 = EdgeInsets.symmetric(
  horizontal: 51,
);

const baseViewPadding23 = EdgeInsets.symmetric(
  horizontal: 25,
);

const baseViewPadding27 = EdgeInsets.symmetric(
  horizontal: 27,
);

const baseViewPadding8 = EdgeInsets.symmetric(
  horizontal: 8,
);

const baseViewPadding28 = EdgeInsets.symmetric(
  horizontal: 28,
);

const baseViewPadding1 = EdgeInsets.symmetric(horizontal: 1);

const baseViewPadding7 = EdgeInsets.symmetric(horizontal: 7);

const baseViewPadding119 = EdgeInsets.symmetric(horizontal: 119.5);

const baseViewPadding4_39 = EdgeInsets.symmetric(
  vertical: 4.39,
);

const baseViewPaddingV6 = EdgeInsets.symmetric(
  vertical: 6,
);

const baseViewTopPadding20 = EdgeInsets.only(
  top: 20,
);

const baseViewTopPadding = EdgeInsets.only(
  top: 44,
);

const baseViewTopPadding10 = EdgeInsets.only(
  top: 10,
);

const baseViewTopPadding93 = EdgeInsets.only(
  top: 93,
);

const baseViewTopPadding117 = EdgeInsets.only(
  top: 117, left: 24, right: 24
);

const baseViewTopPadding116 = EdgeInsets.only(
  top: 116,
);

const baseViewTopLRPadding60_24 = EdgeInsets.only(
  top: 60, left: 24, right: 24
);

const baseViewLeftPadding2_25 = EdgeInsets.only(
  left: 2.25,
);

const baseViewLeftPadding16 = EdgeInsets.only(
  left: 16,
);

const baseViewRightPadding7 = EdgeInsets.only(
  right: 7,
);

const baseViewRightPadding12 = EdgeInsets.only(
  right: 12,
);

const baseViewRightPadding10 = EdgeInsets.only(
  right: 10,
);

const baseViewLeftPadding24 = EdgeInsets.only(
  left: 24,
);

const baseViewBottomPadding8 = EdgeInsets.only(
  bottom: 8,
);

const baseViewBottomPadding20 = EdgeInsets.only(
  bottom: 20,
);

const baseViewBottomPadding35 = EdgeInsets.only(
  bottom: 35,
);

const baseViewLRBPadding2420 = EdgeInsets.only(
  bottom: 20,
  left: 24,
  right: 24,
);

const baseViewPadding = EdgeInsets.symmetric(
  horizontal: 20,
);

const baseViewPadding12 = EdgeInsets.symmetric(horizontal: 12);


const baseViewVH1020Padding = EdgeInsets.symmetric(
  horizontal: 20, vertical: 10
);

const baseViewVH2016Padding = EdgeInsets.symmetric(
    horizontal: 16, vertical: 20
);

const baseViewVH1216Padding = EdgeInsets.symmetric(
    horizontal: 16, vertical: 12
);

const baseViewVH1214Padding = EdgeInsets.symmetric(
    horizontal: 14, vertical: 12
);

const baseViewVH1012Padding = EdgeInsets.symmetric(vertical: 10, horizontal: 13);

const baseViewH13Padding = EdgeInsets.symmetric(horizontal: 13);

const baseViewPadding21 = EdgeInsets.symmetric(
  horizontal: 21,
);

const actionButtonPadding10 = EdgeInsets.symmetric(
  horizontal: 10,
);

const actionButtonPadding = EdgeInsets.symmetric(
  horizontal: 12,
);

const actionButtonPaddingV12 = EdgeInsets.symmetric(
  vertical: 12,
);

const actionButtonPadding15 = EdgeInsets.symmetric(
  horizontal: 15,
);

const baseViewPaddingBig = EdgeInsets.symmetric(
  horizontal: 30,
);

const baseViewPaddingBig25 = EdgeInsets.symmetric(
  horizontal: 25,
);

const baseViewPaddingBig46 = EdgeInsets.symmetric(
  horizontal: 46,
);

const baseViewPaddingBig50 = EdgeInsets.symmetric(
  horizontal: 50,
);

const baseViewPaddingExtra = EdgeInsets.symmetric(
  horizontal: 18,
);