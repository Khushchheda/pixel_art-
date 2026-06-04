import 'package:flutter/material.dart';
import 'widgets/artboard_widget.dart';

class ArtboardScreen extends StatelessWidget {
  const ArtboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pixel Art'), centerTitle: true),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
                MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
          ),
          child: const ArtboardWidget(),
        ),
      ),
    );
  }
}
