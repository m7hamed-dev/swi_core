import 'package:swi_core/swi_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedSvgIcon extends StatelessWidget {
  const RoundedSvgIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.backgroundColor,
    this.iconColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.margin,
  });

  final String icon;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  final BoxFit fit;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(color: backgroundColor, borderRadius: defaultBorderRadius),
      child: SvgPicture.asset(icon, width: size, height: size, color: iconColor, fit: fit),
    );
  }
}
