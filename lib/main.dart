import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './injections.dart' as di;
import 'package:ringy_flutter/ringy/presentation/routes/router.dart';

Future<void> main() async {
  GestureBinding.instance?.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _router  = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ringy',
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    );
  }
}

