import 'package:flutter/material.dart';
import 'package:returants_app/app/my_app.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}
