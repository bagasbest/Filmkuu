import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmkuu/screens/register_screen.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseService {


  static Future<XFile?> getImageGallery() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);
    if ((image != null)) {
      return image;
    } else {
      return null;
    }
  }

  static Future<String?> uploadImageMovie(XFile imageFile) async {
    String filename = basename(imageFile.path);

    FirebaseStorage storage = FirebaseStorage.instance;
    final Reference reference =
    storage.ref().child('movies/$filename');
    await reference.putFile(File(imageFile.path));

    String downloadUrl = await reference.getDownloadURL();
    if (downloadUrl != null) {
      return downloadUrl;
    } else {
      return null;
    }
  }

  static void setMovieData(
      String title, String course, String url, String formatted) {
    try {
      var timeInMillis = DateTime.now().millisecondsSinceEpoch;
      FirebaseFirestore.instance
          .collection('movies')
          .doc(timeInMillis.toString())
          .set({
        'uid': timeInMillis.toString(),
        'title': title,
        'description': course,
        'dateAdded': formatted,
        'dateUpdated': formatted,
        'image': url,
      });
    } catch (error) {
      toast(
          'Gagal menambabhkan Film baru, silahkan cek koneksi anda dan coba lagi nanti');
    }
  }

  static void updateMovieData(
      String title, String course, String url, String formatted, String uid) {
    try {
      FirebaseFirestore.instance.collection('movies').doc(uid).update({
        'title': title,
        'description': course,
        'dateUpdated': formatted,
        'image': url,
      });
    } catch (error) {
      toast(
          'Gagal Memperbarui Film, silahkan cek koneksi anda dan coba lagi nanti');
    }
  }



}