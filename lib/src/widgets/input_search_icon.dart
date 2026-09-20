import 'package:swi_core/swi_core.dart';
import 'package:flutter/material.dart';

class InputSearchIcon extends StatelessWidget {
  const InputSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(7.0),
      child: Icon(AppIcons.search, color: Colors.grey),
    );
  }
}
