import 'package:flutter/material.dart';
import 'widgets/artboard_widget.dart';

class ArtboardScreen extends StatelessWidget {
  const ArtboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pixel Art')),
      body: const ArtboardWidget(),
    );
  }
}
