import 'package:flutter/material.dart';

/// The light theme's surfaces.
///
/// Every field held the same hex value in both apps, which is either the
/// intent or a copy-paste nobody revisited. Kept as separate names so a theme
/// can start pulling them apart without touching its call sites.
class AppLightColors {
  const AppLightColors._();

  static const _surface = Color(0xFF2C2F49);

  static const scaffoldBackground = _surface;
  static const cardColor = _surface;
  static const dialogBackgroundColor = _surface;
  static const dividerColor = _surface;
  static const primaryColor = _surface;
  static const secondaryColor = _surface;
  static const onPrimaryColor = _surface;
}
