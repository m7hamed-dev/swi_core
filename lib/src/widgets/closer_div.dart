import 'package:swi_core/swi_core.dart';
import 'package:flutter/material.dart';

class CloserDiv extends StatelessWidget {
  const CloserDiv({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Center(
        child: Container(
          height: 8.0,
          width: 50.0,
          decoration: const BoxDecoration(
            color: AppColors.greyLight,
            borderRadius: defaultBorderRadius,
          ),
        ),
      ),
    );
  }
}
