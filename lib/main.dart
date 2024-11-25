import 'package:flutter_vict_app/src/application.dart';
import 'package:flutter_vict_app/src/config/setup.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(const Application());
}
