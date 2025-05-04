import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/data_item.dart';

final dataProvider = StateNotifierProvider<DataNotifier, List<DataItem>>(
  (ref) => DataNotifier(),
);

class DataNotifier extends StateNotifier<List<DataItem>> {
  DataNotifier() : super([]);

  void add(DataItem item) => state = [...state, item];
  void updateLabel(String id, String label) =>
      state = [
        for (final item in state)
          if (item.id == id) item.copyWith(label: label) else item,
      ];
  void markSynced(String id) =>
      state = [
        for (final item in state)
          if (item.id == id) item.copyWith(synced: true) else item,
      ];
}
