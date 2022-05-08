import 'package:flutter/material.dart';

class TabControllerHandler extends InheritedWidget {
  final TabController tabController;

  TabControllerHandler(
      {/**required Key key,*/ required this.tabController,
      required Widget child})
      : super(/*key: key,*/ child: child);

  static TabControllerHandler? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabControllerHandler>();
  }

  @override
  bool updateShouldNotify(TabControllerHandler oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.tabController != tabController;
    //throw UnimplementedError();
  }
}
