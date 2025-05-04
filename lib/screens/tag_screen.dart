import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/data_provider.dart';
import 'dart:io';

class TagScreen extends ConsumerWidget {
  const TagScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(dataProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Taguj dane')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          return ListTile(
            leading: Image.file(
              Uri.parse(item.localPath).toFilePath() as File,
              width: 48,
              height: 48,
            ),
            title: Text(item.label.isEmpty ? '⟨brak etykiety⟩' : item.label),
            trailing: Icon(item.synced ? Icons.cloud_done : Icons.edit),
            onTap: () => _editLabel(context, ref, item.id, item.label),
          );
        },
      ),
    );
  }

  Future<void> _editLabel(
    BuildContext context,
    WidgetRef ref,
    String id,
    String current,
  ) async {
    final controller = TextEditingController(text: current);
    final label = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Podaj etykietę'),
            content: TextField(controller: controller, autofocus: true),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Anuluj'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, controller.text),
                child: const Text('OK'),
              ),
            ],
          ),
    );
    if (label != null) {
      ref.read(dataProvider.notifier).updateLabel(id, label);
    }
  }
}
