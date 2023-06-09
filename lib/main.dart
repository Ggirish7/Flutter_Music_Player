import 'package:flutter/material.dart';
import 'package:flutter_music_player/screens/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlayerScreen(),
    );
  }
}
