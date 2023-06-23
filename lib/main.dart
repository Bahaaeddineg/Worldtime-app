import 'package:flutter/services.dart';
import 'package:timeapp/views/homePage.dart';
import 'package:timeapp/views/Menu.dart';
import 'package:flutter/material.dart';
import 'views/LoadinPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
    
  ]);
  
 SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MaterialApp(debugShowCheckedModeBanner: false, routes: {
    '/': (context) => const LoadingPage(),
    '/home': (context) => const Home(),
    '/countries': (context) => const Menu(),
  }));
}
