import 'package:flutter/material.dart';
import 'pages/splash_screen.dart'; // Import the splash screen here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reflex',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // Use SplashScreen as the home
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Text('This is the home page.', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
