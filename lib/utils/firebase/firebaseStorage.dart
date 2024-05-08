import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadProductImage({required Uint8List image, required String productId, required imageNo}) async {
    Reference storageRef =
    FirebaseStorage.instance.ref().child("productImages").child(productId).child(imageNo);
    UploadTask uploadTask = storageRef.putData(image);
    TaskSnapshot task = await uploadTask;
    return task.ref.getDownloadURL();
  }

  Future<String> uploadImageToStorage(File compressedFile) async {

    final storage = FirebaseStorage.instance;
    final Reference ref = storage.ref().child("profileImages").child(FirebaseAuth.instance.currentUser!.email!);
    final TaskSnapshot uploadTask = await ref.putFile(compressedFile);

    if (uploadTask.state == TaskState.success) {
      // Image uploaded successfully
      final String imageUrl = await ref.getDownloadURL();
      // Do something with the imageUrl
      return imageUrl;
    } else {
      // Error uploading image
      return "";
    }
  }
}
