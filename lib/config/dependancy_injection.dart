import 'package:flutter/material.dart';
import '../core/storage/local/database/provider/database_provider.dart';

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseProvider().initDatabase();
}
