import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/data_provider.dart';
import '../services/api_service.dart';

class SyncScreen extends ConsumerWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(dataProvider);

    Future<void> _sync() async {
      final notifier = ref.read(dataProvider.notifier);
      for (final item in items.where((e) => !e.synced && e.label.isNotEmpty)) {
        await ApiService.upload(item);
        notifier.markSynced(item.id);
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Synchronizacja ukończona')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Synchronizacja')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.cloud_upload),
          label: const Text('Wyślij wszystkie'),
          onPressed: _sync,
        ),
      ),
    );
  }
}
