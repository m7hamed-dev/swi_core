import 'package:flutter/material.dart';

/// The palette both apps draw from.
///
/// The two copies had drifted on four values: the primary blue, the near
/// black, the dark surface and the disabled button. This is one palette; a
/// colour that should differ per app belongs in that app's theme, not here.
class AppColors {
  const AppColors._();

  //! Brand
  /// Measured against the logo, whose dominant colour is `#1F3985`. The two
  /// apps had drifted to different blues; this is the closer of them.
  static const Color primary = Color(0xFF014ED7);
  static const Color secondary = Color(0xFF008BFF);
  static const Color primaryLight = Color(0xFFC7CDFA);
  static const Color secondaryLight = Color(0xFFEFF6FF);
  static const Color card = Color(0xFF00C0BF);
  static const List<Color> gradiens = [primary, secondary];

  // Animation Colors
  static const Color shimmer = Color(0xFFEBEBF4);
  static const Color shimmerSecondColor = Color.fromARGB(255, 151, 149, 149);
  static const Color borderColor = Color.fromARGB(255, 215, 213, 213);

  // Custom Colors
  static const Color greyWidgetColor = Colors.grey;
  static const Color white = Color.fromARGB(255, 207, 207, 207);
  static const Color iconColor = Colors.grey;
  static const Color black = Color(0xFF101828);
  static const Color border = Color.fromARGB(255, 196, 199, 218);

  // Basic Colors
  static const Color blue = Color.fromARGB(255, 32, 53, 243);
  static const Color green = Color(0xFF10B981);
  static const Color red = Color(0xFFEF4444);
  static const Color grey = Color(0xFFB3B3B3);

  // Highlight Colors
  static const Color greyLight = Color.fromARGB(255, 237, 237, 237);
  static const Color blueLight = Color.fromARGB(255, 210, 230, 246);
  static const Color greenLight = Color.fromARGB(255, 201, 253, 201);
  static const Color redLight = Color.fromARGB(255, 250, 200, 200);

  // Warning and Error Colors
  static const Color orange = Color.fromARGB(255, 255, 165, 0);
  static const Color warning = Color.fromARGB(255, 234, 115, 0);
  static const Color error = Color.fromARGB(255, 185, 12, 0);

  // Additional Colors
  static const Color transparent = Colors.transparent;

  // Text Colors
  static const Color textPrimary = Color(0xFF262626);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFF9E9E9E);

  // Primary & Background
  // static const Color primaryDark = Color(0xFF0f1520);
  static const Color primaryDark = Color(0xFF1D1F2B);
  static const Color cardBackground = Color(0xFFf5f7fa);

  // Status Colors
  static const Color activeStatus = Color(0xFF4CAF50);
  static const Color inactiveStatus = Color(0xFFF44336);

  // Text Colors
  static const Color primaryText = Color(0xFF333333);
  static const Color secondaryText = Color(0xFF666666);

  // Background Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFBDBDBD);

  // Icon Colors
  static const Color iconPrimary = Color(0xFF262626);
  static const Color iconSecondary = Color(0xFF757575);
  static const Color iconDisabled = Color(0xFF9E9E9E);

  // Border Colors
  static const Color borderPrimary = Color(0xFFE0E0E0);
  static const Color borderSecondary = Color(0xFFBDBDBD);
  static const Color borderDisabled = Color(0xFF9E9E9E);

  // Divider Colors
  static const Color divider = Color(0xFFE0E0E0);

  // Overlay Colors
  static const Color overlay = Color.fromRGBO(0, 0, 0, 0.5);

  // Shadow Colors
  static const Color shadow = Color.fromRGBO(0, 0, 0, 0.1);

  // Success and Info Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color info = Color(0xFF2196F3);

  //! Web chrome
  static const Color webHeader = Color(0xFFF9FAFB);

  // Dark Mode Colors
  static const Color darkPrimary = Color(0xFF121212);
  static const Color darkSecondary = Color(0xFF1E1E1E);
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkOnPrimary = Color(0xFFFFFFFF);
  static const Color darkOnSecondary = Color(0xFFFFFFFF);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkOnBackground = Color(0xFFFFFFFF);
}
