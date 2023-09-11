// import 'dart:io';
// import 'package:get/get.dart';
// import '/controller/navigation.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';

// import '../view/photo/save_image.dart';

// class PhotoController extends GetxController {
//   var selectedImage = Rx<File?>(null);

//   Future<void> pickImage() async {
//     try {
//       final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

//       if (pickedImage != null) {
//         selectedImage.value = File(pickedImage.path);
//         await _saveImageToLocal(selectedImage.value!);
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }


//   Future<void> _saveImageToLocal(File image) async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final fileName = path.basename(image.path);
//       final localFilePath = path.join(directory.path, fileName);

//       await image.copy(localFilePath);

//       final imageDatabase = ImageDatabase();
//       await imageDatabase.insertImage(localFilePath);

//       // Navigate to DisplayImagePage and pass the saved image
//       Get.to(DisplayImagePage(image: image));
//     } catch (e) {
//       print('Error saving image: $e');
//     }
//   }


// }
