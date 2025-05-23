import 'dart:io';
import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xml_parser/config/supabase/supabase_db.dart';

class UploadRepo {
  final client = SupabaseDB.instance.client;
  static const String bucketName = String.fromEnvironment('bucket_name');

  // Carica un file nel bucket Supabase Storage.
  Future<String> uploadFile(String filePath, String fileName) async {
    final file = File(filePath);
    final uploadName = '${DateTime.now().millisecondsSinceEpoch}-$fileName';
    await client.storage.from(bucketName).upload('uploads/$uploadName', file);

    return 'uploads/$uploadName';
  }

  /// Carica dati binari nel bucket Supabase Storage.
  Future<String> uploadBytes(List<int> bytes, String fileName) async {
    final uploadName = '${DateTime.now().millisecondsSinceEpoch}-$fileName';
    final path = 'uploads/$uploadName';
    await client.storage
        .from(bucketName)
        .uploadBinary(path, Uint8List.fromList(bytes));
    return path;
  }

  /// Ottiene l'URL pubblico di un file caricato.
  Future<String> getPublicUrl(String bucketName, String filePath) async {
    return client.storage.from(bucketName).getPublicUrl(filePath);
  }

  /// Elimina un file dal bucket Supabase Storage.
  Future<void> deleteFile(String bucketName, String filePath) async {
    await client.storage.from(bucketName).remove([filePath]);
  }

  /// Lista tutti i file in un bucket.
  Future<List<FileObject>> listFiles(String bucketName, {String? path}) async {
    return await client.storage.from(bucketName).list(path: path);
  }
}
