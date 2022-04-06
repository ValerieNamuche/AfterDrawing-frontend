import 'package:flutter/material.dart';
import 'src/pages/Login.dart';
import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'project',
      onGenerateRoute: router.generateRoute,
    );
  }
}
