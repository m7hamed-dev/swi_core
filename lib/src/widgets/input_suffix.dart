import 'package:swi_core/src/widgets/input_clear_icon.dart';
import 'package:swi_core/src/widgets/input_eye_or_splash_eye.dart';
import 'package:flutter/material.dart';

class InputSuffix extends StatelessWidget {
  const InputSuffix({
    super.key,
    this.controller,
    required this.keyboardType,
    this.onChanged,
    this.readOnly = false,
    this.obscureText = false,
    required this.toggleObscureText,
  });

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final void Function(String query)? onChanged;
  final bool readOnly;
  final bool obscureText;
  final void Function() toggleObscureText;

  @override
  Widget build(BuildContext context) {
    if (keyboardType != TextInputType.visiblePassword) {
      return ClearInpptText(
        controller: controller,
        onChanged: onChanged,
        isReadOnly: readOnly,
      );
    }
    return IconButton(
      icon: EyeOrSplashEye(obscureText: obscureText),
      padding: const .symmetric(horizontal: 20),
      onPressed: toggleObscureText,
    );
  }
}
