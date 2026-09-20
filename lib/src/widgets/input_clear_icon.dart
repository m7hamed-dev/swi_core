import 'package:flutter/material.dart';

class ClearInpptText extends StatelessWidget {
  const ClearInpptText({
    super.key,
    this.controller,
    this.onChanged,
    this.isReadOnly = false,
  });
  final TextEditingController? controller;
  final void Function(String query)? onChanged;
  final bool isReadOnly;
  @override
  Widget build(BuildContext context) {
    if (isReadOnly) {
      return const SizedBox();
    }
    if (controller != null && controller!.text.isNotEmpty) {
      return IconButton(
        icon: const Icon(Icons.clear, size: 14, color: Colors.grey),
        padding: const .symmetric(horizontal: 20),
        onPressed: () {
          controller!.clear();
          if (onChanged != null) {
            onChanged!('');
          }
        },
      );
    }
    return const SizedBox();
  }
}

extension TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}
