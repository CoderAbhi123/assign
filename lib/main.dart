import 'package:assignment_task/view/view/back.dart';
import 'package:assignment_task/view/view/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter test',
    initialRoute: '/back_screen/',
    routes: {
      '/assign_screen/': (context)=> const screen_view(),
      '/back_screen/': (context)=> const back_view(),
    },
  ));
}



