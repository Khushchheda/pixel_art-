import 'dart:math';

import 'package:flutter/material.dart';
import 'palette_color_widget.dart';

const int length = 5;
const int width = 5;

const int size = length * width;

final List<Color> paletteColors = List.generate(
  15,
  (index) => Color.fromARGB(

    
    255,
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
  ),
);

class ArtboardWidget extends StatefulWidget {
  const ArtboardWidget({super.key});

  @override
  State<ArtboardWidget> createState() => _ArtboardWidgetState();
}

class _ArtboardWidgetState extends State<ArtboardWidget> {
  List<Color?> pixels = List.generate(size, (index) => null);
  Color selectedColor = paletteColors.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width,
            ),
            itemCount: pixels.length,
            itemBuilder: (context, index) {
              final isFilled = pixels[index] != null;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pixels[index] = pixels[index] == selectedColor
                        ? null
                        : selectedColor;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: isFilled ? pixels[index] : Colors.grey[900],
                    border: Border.all(color: Colors.white24),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 56,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: paletteColors.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return PaletteColorWidget(
                isSelected: paletteColors[index] == selectedColor,
                color: paletteColors[index],
                onTap: () {
                  setState(() {
                    selectedColor = paletteColors[index];
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () {
            setState(() {
              pixels = List.generate(size, (index) => null);
            });
          },
          child: const Text('Clear'),
        ),
      ],
    );
  }
}
