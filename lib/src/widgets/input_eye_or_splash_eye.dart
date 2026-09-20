import 'package:swi_core/swi_core.dart';
import 'package:flutter/material.dart';

class EyeOrSplashEye extends StatelessWidget {
  const EyeOrSplashEye({super.key, required this.obscureText});
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    if (obscureText) {
      return const Icon(AppIcons.eye, size: 14, color: Colors.grey);
    }
    return const Icon(AppIcons.eyeSlash, size: 14, color: Colors.grey);
  }
}
