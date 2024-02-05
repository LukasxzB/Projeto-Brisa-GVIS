import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gvis_mobilidade/src/app_consts/app_string.dart';
import 'package:gvis_mobilidade/src/features/load_app/pages/load_app_page.dart';

void main() {
  // A tela de splash deverá ser exibida até a página inicial ser carregada,
  // então a mesma irá remover. (Página inicial: LoadAppPage)
  debugPaintSizeEnabled = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appShortTitle,
      home: const LoadAppPage(),
    );
  }
}
