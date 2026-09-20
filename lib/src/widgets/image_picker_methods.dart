import 'package:image_picker/image_picker.dart';

abstract class ImagePickerMethods {
  Future<void> pickImage({ImageSource source, bool isMultiImage = false});
  void removeImage();
}
