import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
part 'data_item.freezed.dart';
part 'data_item.g.dart';

@freezed
class DataItem with _$DataItem {
  const factory DataItem({
    required String id,
    required String localPath,
    @Default('') String label,
    @Default(false) bool synced,
  }) = _DataItem;

  factory DataItem.newLocal(String path) =>
      DataItem(id: const Uuid().v4(), localPath: path);
  factory DataItem.fromJson(Map<String, dynamic> json) =>
      _$DataItemFromJson(json);
}
