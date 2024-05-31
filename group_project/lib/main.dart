//main dart file

import 'package:flutter/material.dart';
import 'login.dart'; 
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RwandaConnect',
      theme: ThemeData(
       
      ),
      initialRoute: '/home', 
      routes: {
        '/home': (context) => HomePage(), 
      },
    );
  }
}
