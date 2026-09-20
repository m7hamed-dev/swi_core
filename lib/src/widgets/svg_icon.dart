import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swi_core/src/constants/colors.dart';

/// An SVG asset drawn as an icon.
///
/// The tint follows, in order: an explicit [color], the asset's own colours
/// when [usingOriginalColor] is set, and otherwise the ambient theme's
/// brightness. Reading the brightness off the widget tree is what lets this
/// live outside the apps: it used to watch a Riverpod settings provider, which
/// meant the widget could only exist where that provider did.
class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.usingOriginalColor = false,
    this.color,
    this.fit = BoxFit.contain,
    this.isDarkMode,
  });

  /// Asset path. An empty path draws nothing rather than throwing.
  final String icon;
  final double size;
  final Color? color;
  final BoxFit fit;

  /// Draw the asset with the colours it was authored in.
  final bool usingOriginalColor;

  /// Overrides the ambient brightness. Only needed where the icon sits under
  /// a theme that does not match the surface it is drawn on.
  final bool? isDarkMode;

  @override
  Widget build(BuildContext context) {
    if (icon.isEmpty) return const SizedBox.shrink();

    return SvgPicture.asset(
      icon,
      width: size,
      height: size,
      fit: fit,
      colorFilter: usingOriginalColor ? null : ColorFilter.mode(_tint(context), BlendMode.srcIn),
    );
  }

  Color _tint(BuildContext context) {
    if (color != null) return color!;
    final dark = isDarkMode ?? Theme.of(context).brightness == Brightness.dark;
    return dark ? AppColors.white : AppColors.black;
  }
}
