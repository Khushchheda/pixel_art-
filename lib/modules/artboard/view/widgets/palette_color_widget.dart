import 'package:flutter/material.dart';

class PaletteColorWidget extends StatelessWidget {
  const PaletteColorWidget({
    super.key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  });

  final Color color;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final size = screenWidth < 600 ? 45.0 : 50.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          border: isSelected
              ? Border.all(
                  color: Colors.white,
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 3,
                )
              : null,
        ),
        child: isSelected
            ? const Center(child: Icon(Icons.check, size: 20))
            : null,
      ),
    );
  }
}
