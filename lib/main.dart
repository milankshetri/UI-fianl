import 'package:airfly/core/app.dart';
import 'package:airfly/core/network/local/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService().init();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
