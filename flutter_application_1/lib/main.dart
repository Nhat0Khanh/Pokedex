import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Mua Sắm',
      debugShowCheckedModeBanner: false, // Tắt chữ DEBUG xấu xí ở góc màn hình
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      // Gọi màn hình Shopping của bạn làm màn hình chính khi mở app
      home: const LoginScreen(), 
    );
  }
} 