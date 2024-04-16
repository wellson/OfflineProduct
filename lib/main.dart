import 'package:flutter/material.dart';
import 'package:produtos/core/datasource/local/object_box.dart';
import 'package:produtos/core/di/modules/di.dart';
import 'package:produtos/modules/home/home_page.dart';

late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Produtos',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
