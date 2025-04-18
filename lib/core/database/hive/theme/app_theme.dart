import 'package:hive_ce/hive.dart';

part 'app_theme.g.dart';

@HiveType(typeId: 1)
enum AppTheme {
  @HiveField(0)
  system,

  @HiveField(1)
  light,

  @HiveField(2)
  dark,
}
