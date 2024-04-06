import 'dart:convert';
import 'dart:io';
import 'package:cv_ez/src/models/Template.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageUploader {
  Future<void> uploadImagesToFirebaseStorage() async {
    final assetFiles = await _listAssets();

    for (final assetPath in assetFiles) {
      final file = await _copyAssetToFile(assetPath);

      final ref = FirebaseStorage.instance.ref("Templates").child(assetPath.split('/').last);
      UploadTask uploadTask = ref.putFile(file);
      final snapShot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapShot.ref.getDownloadURL();

      DatabaseReference databaseReference = FirebaseDatabase.instance.ref("Templates");
      Template template = Template(templateName: assetPath, url: downloadUrl);
      await databaseReference.child(generateRandomUUID()).set(template);
    }
  }

  Future<List<String>> _listAssets() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final filteredAssets = manifestMap.keys.where((String key) {
      return key.contains('assets/') && key.endsWith('.jpg');
    }).toList();

    return filteredAssets;
  }


  Future<File> _copyAssetToFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final file = File('${(await getTemporaryDirectory()).path}/${assetPath.split('/').last}');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    return file;
  }

  String generateRandomUUID() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}
