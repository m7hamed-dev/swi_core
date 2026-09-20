import 'package:image_picker/image_picker.dart';

class ImageState {
  const ImageState({this.images, this.isLoading = false, this.image});
  final bool isLoading;
  final XFile? image;
  final List<XFile>? images;

  ImageState copyWith({List<XFile>? images, bool? isLoading, XFile? image}) {
    return ImageState(
      isLoading: isLoading ?? this.isLoading,
      image: image ?? this.image,
      images: images ?? this.images,
    );
  }
}
