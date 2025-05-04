import 'package:flutter/material.dart';
import 'capture_screen.dart';
import 'tag_screen.dart';
import 'sync_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Data Preparer')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Tile(
            icon: Icons.camera_alt,
            title: 'Zrób zdjęcie / nagraj',
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CaptureScreen()),
                ),
          ),
          _Tile(
            icon: Icons.label,
            title: 'Oznacz dane',
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TagScreen()),
                ),
          ),
          _Tile(
            icon: Icons.cloud_upload,
            title: 'Synchronizuj',
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SyncScreen()),
                ),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _Tile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}
