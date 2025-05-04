import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static Future<String> tempPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  static Future<String> saveTempFile(File file) async {
    final dir = await tempPath();
    final newPath =
        '$dir/${DateTime.now().millisecondsSinceEpoch}_${file.uri.pathSegments.last}';
    return file.copy(newPath).then((f) => f.path);
  }
}
