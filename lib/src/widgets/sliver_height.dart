import 'package:swi_core/swi_core.dart';
import 'package:flutter/material.dart';

class SliverHeight extends StatelessWidget {
  const SliverHeight({super.key, this.height = defaultPadding});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height));
  }
}
