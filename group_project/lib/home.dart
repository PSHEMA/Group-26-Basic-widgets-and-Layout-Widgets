// home dart file contains the home page of the app

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Welcome message
          Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome to RwandaExplore App! Please login or register.',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
          // Login and register buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to login screen
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to registration screen
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Register'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
