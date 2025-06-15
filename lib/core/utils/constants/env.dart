import 'package:flutter_dotenv/flutter_dotenv.dart';

class VEnv {
  VEnv._();

  static final String backupEncryptionKey = dotenv.get('BACKUP_ENCRYPTION_KEY');
}
