import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:youtube_clone/app.dart';
import 'package:youtube_clone/getit_injection.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  init();

  runApp(const MyApp());
}
