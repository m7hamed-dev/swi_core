import 'package:flutter/material.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.image, color: Color.fromARGB(255, 16, 17, 50));
  }
}
