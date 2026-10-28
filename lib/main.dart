import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const FedTeamApp());
}

class FedTeamApp extends StatelessWidget {
  const FedTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FED Team',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F4B99)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
