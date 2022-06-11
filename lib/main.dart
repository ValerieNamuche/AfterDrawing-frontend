import 'package:afterdrawing/src/utils/CustomScrollBehavior.dart';
import 'package:afterdrawing/src/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'After Drawing',
      initialRoute: 'main_view',
      key: Utils.mainNavigator,
      onGenerateRoute: router.generateRoute,
    );
  }
}
