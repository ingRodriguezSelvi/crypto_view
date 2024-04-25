

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ValidationTokenUseCase {
  final storage = const FlutterSecureStorage();

  ValidationTokenUseCase();

  Future<bool> call() async {

      return await storage.read(key: 'token') != null;
  }
}
