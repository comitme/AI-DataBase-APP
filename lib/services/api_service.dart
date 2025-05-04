import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/data_item.dart';

class ApiService {
  static const _baseUrl = 'https://your‑backend.example.com';

  static Future<void> upload(DataItem item) async {
    final uri = Uri.parse('$_baseUrl/upload');
    final req =
        http.MultipartRequest('POST', uri)
          ..fields['id'] = item.id
          ..fields['label'] = item.label
          ..files.add(
            await http.MultipartFile.fromPath('file', item.localPath),
          );
    await req.send();
  }
}
