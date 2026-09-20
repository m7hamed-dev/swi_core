import 'package:swi_core/swi_core.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickedImageCard extends StatelessWidget {
  const PickedImageCard({
    super.key,
    required this.image,
    required this.imagesList,
    required this.onRemoveImage,
  });

  final XFile image;
  final List<XFile> imagesList;
  final void Function(int index)? onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadiusMedium,
              border: Border.all(color: AppColors.grey, width: 0.8),
              image: DecorationImage(
                image: FileImage(File(image.path)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const ImageShadow(),

        Positioned(
          bottom: 0,
          left: 0,
          child: IconButton(
            icon: CircleAvatar(
              backgroundColor: AppColors.red.withAlpha(50),
              child: const Icon(AppIcons.trash, color: AppColors.red),
            ),
            onPressed: () {
              onRemoveImage?.call(imagesList.indexOf(image));
            },
          ),
        ),
      ],
    );
  }
}

class ImageShadow extends StatelessWidget {
  const ImageShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: .3),
            Colors.transparent,
            Colors.black.withValues(alpha: .3),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
