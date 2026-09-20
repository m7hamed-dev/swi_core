import 'package:swi_core/src/constants/values.dart';
import 'package:flutter/cupertino.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({super.key, this.padding});
  static const size = 24.0;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        margin: EdgeInsets.all(padding ?? defaultPaddingLarge),
        child: const Center(child: CupertinoActivityIndicator()),
      ),
    );
  }
}
