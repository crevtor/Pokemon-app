import 'dart:math';

import 'package:flutter/widgets.dart';

/// Primary color and its variants
const primary1200 = Color(0xFF1B1F00);
const primary1000 = Color(0xFF333A00);
const primary900  = Color(0xFF4B5600);
const primary850  = Color(0xFF647200);
const primary800  = Color(0xFF7C8E00);
const primary700  = Color(0xFF94AA00);
const primary600  = Color(0xFFACC500);
const primary550  = Color(0xFFC5E100);
const primary500  = Color(0xFFDDFD00);
const primary450  = Color(0xFFDCF624);
const primary400  = Color(0xFFDBF048);
const primary370  = Color(0xFFDCEC6A);
const primary350  = Color(0xFFDEEA89);
const primary300  = Color(0xFFE2EBA6);
const primary200  = Color(0xFFE8EDC1);
const primary100  = Color(0xFFEFF2DA);
const primary50   = Color(0xFFF8F9F1);


/// Secondary color and its variants
const secondary1200 = Color(0xFFD6CFB2);
const secondary1000 = Color(0xFFE0D9B9);
const secondary900  = Color(0xFFE9E2C2);
const secondary850  = Color(0xFFF0EACB);
const secondary800  = Color(0xFFF6F0D6);
const secondary700  = Color(0xFFFBF6E1);
const secondary600  = Color(0xFFFDF9E8);
const secondary550  = Color(0xFFFFFCEB);
const secondary500  = Color(0xFFFFFFE9);
const secondary450  = Color(0xFFFFFFF4);
const secondary400  = Color(0xFFFEFDF7);
const secondary370  = Color(0xFFFEFDF9);
const secondary350  = Color(0xFFFFFFFA);
const secondary300  = Color(0xFFFFFFFB);
const secondary200  = Color(0xFFFFFFFD);
const secondary100  = Color(0xFFFFFFFE);
const secondary50   = Color(0xFFFFFFFF);


/// Charcoal color and its variants
const charcoal1200 = Color(0xFF0C0D0E);
const charcoal1000 = Color(0xFF141516);
const charcoal900  = Color(0xFF1D1E1F);
const charcoal850  = Color(0xFF232425);
const charcoal800  = Color(0xFF2A2B2C);
const charcoal700  = Color(0xFF313233);
const charcoal650  = Color(0xFF363636);
const charcoal600  = Color(0xFF353637);
const charcoal550  = Color(0xFF37383A);
const charcoal500  = Color(0xFF393B3C);
const charcoal450  = Color(0xFF424445);
const charcoal400  = Color(0xFF4A4C4D);
const charcoal370  = Color(0xFF545556);
const charcoal350  = Color(0xFF606162);
const charcoal300  = Color(0xFF6C6D6E);
const charcoal200  = Color(0xFF808182);
const charcoal150  = Color(0xFFAEAEAE);
const charcoal100  = Color(0xFFB7B8B9);
const charcoal50   = Color(0xFFF2F2F3);


///Grayscale
const grayScale910 = Color(0xff181818);
const grayScale905 = Color(0xff1C1B1F);
const grayScale900 = Color(0xff1a1919);
const grayScale850 = Color(0xff1E1E1E);
const grayScale800 = Color(0xff222121);
const grayScale700 = Color(0xff2b292a);
const grayScale600 = Color(0xff333132);
const grayScale695 = Color(0xFF373737);
const grayScale690 = Color(0xff404041);
const grayScale680 = Color(0xFF484848);
const grayScale550 = Color(0xFF505054);
const grayScale500 = Color(0xff555354);
const grayScale450 = Color(0xff5D5D5D);
const grayScale400 = Color(0xff777676);
const grayScale350 = Color(0xFF838383);
const grayScale320 = Color(0xff808080);
const grayScale310 = Color(0xff848486);
const grayScale300 = Color(0xff999898);
const grayScale250 = Color(0xffA4A4A3);
const grayScale200 = Color(0xffbbbabb);
const grayScale150 = Color(0xffDADADA);
const grayScale130 = Color(0xffD4D4D4);
const grayScale120 = Color(0xffD9D9D9);
const grayScale110 = Color(0xffE4E4E4);
const grayScale100 = Color(0xffe1e1e1);
const grayScale70 = Color(0xffF9F9F9);
const grayScale50 = Color(0xfff6f6f6);
const grayScale20 = Color(0xffEAEAEA);
const grayScale15 = Color(0xffF5F5F5);
const grayScale10 = Color(0xffF1F1F1);


///Blackscale
const black100 = Color(0xFFFFFFFF);
const black150 = Color(0xFFF7F7F7);
const black160 = Color(0xffEFEFEF);
const black170 = Color(0xffECECEC);
const black172 = Color(0xffEBEBEC);
const black180 = Color(0xFFE7E6E8);
const black200 = Color(0xFFDFDFDF);
const black300 = Color(0xFFBFBFBF);
const black400 = Color(0xFF9F9F9F);
const black450 = Color(0xFF999999);
const black500 = Color(0xFF7F7F7F);
const black550 = Color(0xFF737373);
const black600 = Color(0xFF5F5F5F);
const black700 = Color(0xFF3F3F3F);
const black800 = Color(0xFF12041D);
const black900 = Color(0xFF000000);

///Blue scale
const blueScale900 = Color(0xff1E293B);
const blueScale800 = Color(0xff1B2443);
const blueScale700 = Color(0xff273464);
const blueScale600 = Color(0xff37498B);
const blueScale400 = Color(0xff6F7AA0);
const blueScale350 = Color(0xff90A9F8);
const blueScale300 = Color(0xff9BAEEC);
const blueScale250 = Color(0xffA4B8FC);
const blueScale200 = Color(0xffB1B7CD);
const blueScale100 = Color(0xffC5CADE);

const green900 = Color(0xff13B601);
const green500 = Color(0xff92DD8A);

///Status Colors
///Success
const success900 = Color(0xff145730);
const success800 = Color(0xff1a7440);
const success700 = Color(0xff219150);
const success600 = Color(0xff27ae60);
const success500 = Color(0xff4bbb7b);
const success400 = Color(0xff6fc995);
const success300 = Color(0xff93d6af);
const success200 = Color(0xffb7e4ca);
const success100 = Color(0xffd4efdf);
const success50 = Color(0xffedfff5);

///Error
const error900 = Color(0xff782323);
const error800 = Color(0xff9f2e2e);
const error700 = Color(0xffc73a3a);
const error600 = Color(0xffef4545);
const error500 = Color(0xfff26464);
const error400 = Color(0xfff48383);
const error300 = Color(0xfff7a2a2);
const error200 = Color(0xfffac1c1);
const error100 = Color(0xfffcdada);
const error50 = Color(0xffffe7e7);

///Others
const white = Color(0xffffffff);
const black = Color(0xff000000);

const black10 = Color(0xff6C7382);

const offWhite = Color(0xFFF5F4F4);
const offWhiteBlue = Color(0xFFA2E9FF);
const lime = Color(0xFFFBFAC8);
const whiteSilver50 = Color(0xFFB6B1B9);