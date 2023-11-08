import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/config.dart';
import 'package:vocardo/core/service/isar/isar_service.dart';

part 'config_service.g.dart';

@Riverpod(keepAlive: true)
class ConfigService extends _$ConfigService {
  @override
  Stream<Config> build() async* {
    final db = await ref.read(isarProvider.future);
    await for (final _ in db.configs.watchLazy(fireImmediately: true)) {
      final result = await db.configs.where().findFirst();
      yield result ?? defaultConfig;
    }
  }

  Future<void> saveConfig(Config config) async {
    final db = await ref.read(isarProvider.future);
    await db.writeTxn(() async {
      await db.configs.put(config);
    });
  }
}
