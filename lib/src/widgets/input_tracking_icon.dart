import 'package:flutter/material.dart';

enum TrackingInputLevel { normal, bad, good, excellent }

class IconTrackingInput extends StatelessWidget {
  const IconTrackingInput({super.key, required this.level});
  final TrackingInputLevel level;
  static const size = 16.0;

  @override
  Widget build(BuildContext context) {
    final icon = switch (level) {
      TrackingInputLevel.bad => const Icon(
        Icons.error,
        size: size,
        color: Colors.red,
      ),
      TrackingInputLevel.good => const Icon(
        Icons.check,
        size: size,
        color: Color.fromARGB(255, 8, 8, 212),
      ),
      //
      TrackingInputLevel.excellent => const Icon(
        Icons.check_circle,
        size: size,
        color: Color.fromARGB(255, 11, 115, 15),
      ),
      //! then hide
      _ => const SizedBox(),
    };
    if (level.index == 0) return const SizedBox();
    //
    return SizedBox(width: 20.0, height: 20.0, child: icon);
  }

  Color get getColor {
    return switch (level) {
      TrackingInputLevel.bad => Colors.red,
      TrackingInputLevel.good => const Color.fromARGB(255, 68, 237, 88),
      TrackingInputLevel.excellent => const Color.fromARGB(255, 11, 39, 216),
      //! then hide
      _ => Colors.transparent,
    };
  }
}
