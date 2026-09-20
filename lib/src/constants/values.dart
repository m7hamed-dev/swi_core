import 'package:flutter/material.dart';

//! padding values
const defaultPadding = 8.0;
const defaultPaddingSmall = 4.0;
const defaultPaddingMedium = 16.0;
const defaultPaddingLarge = 24.0;
const defaultPaddingXLarge = 32.0;
const defaultPaddingXXLarge = 48.0;

//! padding values
/// ### padding all = from all sides set padding value = 8.0
const paddingAll = EdgeInsets.all(defaultPadding);

/// ### padding all small = from all sides set padding value = 4.0
const paddingAllSmall = EdgeInsets.all(defaultPaddingSmall);

/// ### padding all medium = from all sides set padding value = 16.0
const paddingAllMedium = EdgeInsets.all(defaultPaddingMedium);

/// ### padding all large = from all sides set padding value = 24.0
const paddingAllLarge = EdgeInsets.all(defaultPaddingLarge);

/// ### padding all xlarge = from all sides set padding value = 32.0
const paddingAllXLarge = EdgeInsets.all(defaultPaddingXLarge);

//! vertical padding values
const paddingVerticalAll = EdgeInsets.symmetric(vertical: defaultPadding);
const paddingVerticalAllSmall = EdgeInsets.symmetric(vertical: defaultPaddingSmall);
const paddingVerticalAllMedium = EdgeInsets.symmetric(vertical: defaultPaddingMedium);
const paddingVerticalAllLarge = EdgeInsets.symmetric(vertical: defaultPaddingLarge);
const paddingVerticalAllXLarge = EdgeInsets.symmetric(vertical: defaultPaddingXLarge);

//! horizontal padding values
const paddingHorizontalAll = EdgeInsets.symmetric(horizontal: defaultPadding);
const paddingHorizontalAllSmall = EdgeInsets.symmetric(horizontal: defaultPaddingSmall);
const paddingHorizontalAllMedium = EdgeInsets.symmetric(horizontal: defaultPaddingMedium);
const paddingHorizontalAllLarge = EdgeInsets.symmetric(horizontal: defaultPaddingLarge);
const paddingHorizontalAllXLarge = EdgeInsets.symmetric(horizontal: defaultPaddingXLarge);

//! border radius
const defaultBorderRadiusSmall = BorderRadius.all(Radius.circular(4.0));
const defaultBorderRadius = BorderRadius.all(Radius.circular(8.0));
const defaultBorderRadiusMedium = BorderRadius.all(Radius.circular(16.0));
const defaultBorderRadiusLarge = BorderRadius.all(Radius.circular(24.0));
const defaultBorderRadiusXLarge = BorderRadius.all(Radius.circular(32.0));

//! shadow
final defaultBoxShadow = [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 10, spreadRadius: 1)];
final defaultBoxShadowMedium = [BoxShadow(color: Colors.black.withAlpha(90), blurRadius: 10, spreadRadius: 1)];
final defaultBoxShadowLarge = [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 10, spreadRadius: 1)];
