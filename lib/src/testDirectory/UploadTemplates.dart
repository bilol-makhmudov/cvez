import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageUploader {
  Future<void> uploadImagesToFirebaseStorage() async {
    // Assets klasöründeki tüm dosyaların listesi
    final assetFiles = await _listAssets();

    // Her bir dosya için yükleme işlemi
    for (final assetPath in assetFiles) {
      // Asset'ten dosyaya kopyalama
      final file = await _copyAssetToFile(assetPath);

      // Firebase Storage'a yükleme işlemi
      final ref = FirebaseStorage.instance.ref("Templates").child(assetPath.split('/').last);
      UploadTask uploadTask = ref.putFile(file);
      final snapShot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapShot.ref.getDownloadURL();

      // Firebase veritabanına URL'yi kaydetme
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref("Templates");
      HashMap<String,String> map = HashMap();
      map.putIfAbsent("templateName", () => assetPath);
      map.putIfAbsent("url", () => downloadUrl);
      await databaseReference.child(generateRandomUUID()).set(map);
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
