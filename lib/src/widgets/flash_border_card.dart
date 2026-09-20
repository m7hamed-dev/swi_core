// import 'package:swi_core/src/constants/values.dart';
// import 'package:flutter/material.dart';

// class FlashingBorderWidget extends StatefulWidget {
//   const FlashingBorderWidget({
//     super.key,
//     required this.isFlashing,
//     required this.child,
//   });

//   final bool isFlashing;
//   final Widget child;

//   @override
//   FlashingBorderWidgetState createState() => FlashingBorderWidgetState();
// }

// class FlashingBorderWidgetState extends State<FlashingBorderWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _borderAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );

//     _borderAnimation = ColorTween(
//       begin: Colors.red,
//       end: Colors.blue,
//     ).animate(_controller);
//   }

//   @override
//   void didUpdateWidget(covariant FlashingBorderWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.isFlashing) {
//       _controller.repeat(reverse: true);
//       //! stop after 3 seconds
//       Future.delayed(const Duration(seconds: 3), () {
//         _controller.stop();
//         setState(() {});
//       });
//     } else {
//       _controller.stop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _borderAnimation,
//       builder: (context, child) {
//         return Container(
//           decoration: BoxDecoration(
//             border: _border(),
//             borderRadius: defaultBorderRadius,
//           ),
//           child: widget.child,
//         );
//       },
//     );
//   }

//   Border? _border() {
//     if (!widget.isFlashing) return null;
//     return Border.all(color: _borderAnimation.value!, width: 2.0);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
