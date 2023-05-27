import 'package:timeapp/views/homePage.dart';
import 'package:timeapp/views/Menu.dart';

import 'views/countriesMenu.dart';
import 'package:flutter/material.dart';
import 'views/LoadinPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const LoadingPage(),
      '/home': (context) => const Home(),
      '/countries': (context) => const Menu(),
    },
  ));
}
 
