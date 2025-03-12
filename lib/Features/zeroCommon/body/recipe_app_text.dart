import 'package:flutter/material.dart';

class RecipeAppText extends StatelessWidget {
  const RecipeAppText({
    super.key,
    required this.data,
    required this.color,
    required this.size,
    this.family = "Poppins",
    this.weight = FontWeight.w400,
    this.line = true,
    this.height = false,
  });

  final String data;
  final Color color;
  final double size;
  final String family;
  final FontWeight weight;
  final bool? line;
  final bool? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: line == true ? 1 : null, // ✅ To‘g‘rilangan
      overflow: line == true ? TextOverflow.ellipsis : null, // ✅ To‘g‘rilangan
      style: TextStyle(
        fontFamily: family,
        fontSize: size,
        color: color,
        height: height == true ? 1 : null, // ✅ To‘g‘rilangan
        fontWeight: weight,
      ),
    );
  }
}
