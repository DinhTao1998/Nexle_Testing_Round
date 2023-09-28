import 'package:flutter/material.dart';
import '../resources.dart';
/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w400Primary
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppTextStyles {
  AppTextStyles._();
  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    letterSpacing: _defaultLetterSpacing,
    height: 1.5
    // height: 1.0,
  );

  static String ?get fontFamily => GoogleFonts.lato().fontFamily;

  static TextTheme? get textTheme => GoogleFonts.latoTextTheme();

  static TextStyle s14w400Primary({
    double opacity = 1,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:SizeConstants.defaultFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.current.primaryTextColor.withOpacity(opacity),
      ));

  static TextStyle s14w400Secondary({
    double opacity = 1,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:SizeConstants.defaultFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.current.secondaryTextColor.withOpacity(opacity),
      ));
  static TextStyle s12w400Primary({
    double opacity = 1,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:SizeConstants.smallFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.current.primaryTextColor.withOpacity(opacity),
      ));

  static TextStyle s12w400Secondary({
    double opacity = 1,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:SizeConstants.smallFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.current.secondaryTextColor.withOpacity(opacity),
      ));
  static TextStyle s16w400Primary({
    double opacity = 1,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:SizeConstants.titleFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.current.primaryTextColor.withOpacity(opacity),
      ));

  static TextStyle s16w400Secondary({
    double opacity = 1,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:SizeConstants.titleFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.current.secondaryTextColor.withOpacity(opacity),
      ));
  static TextStyle s22w400Primary({
    double opacity = 1,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:SizeConstants.headerFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.current.primaryTextColor.withOpacity(opacity),
      ));

  static TextStyle s22w400Secondary({
    double opacity = 1,
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
        fontSize:SizeConstants.headerFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.current.secondaryTextColor.withOpacity(opacity),
      ));
}