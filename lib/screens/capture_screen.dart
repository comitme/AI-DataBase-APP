import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/data_item.dart';
import '../providers/data_provider.dart';
import '../services/storage_service.dart';

class CaptureScreen extends ConsumerWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picker = ImagePicker();

    Future<void> _pick(ImageSource src) async {
      final XFile? file = await picker.pickImage(source: src, imageQuality: 90);
      if (file == null) return;
      final savedPath = await StorageService.saveTempFile(File(file.path));
      ref.read(dataProvider.notifier).add(DataItem.newLocal(savedPath));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Capture')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.camera),
              label: const Text('Zdjęcie'),
              onPressed: () => _pick(ImageSource.camera),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.photo_library),
              label: const Text('Galeria'),
              onPressed: () => _pick(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
}
