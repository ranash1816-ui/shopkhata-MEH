import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(const ShopkhataApp());
}

class ShopkhataApp extends StatelessWidget {
  const ShopkhataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopkhata BD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF059669), // Green
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF059669),
          secondary: const Color(0xFFF97316), // Orange
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
