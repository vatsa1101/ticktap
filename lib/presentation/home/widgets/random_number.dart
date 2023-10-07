import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RandomNumber extends StatelessWidget {
  final int? number;

  const RandomNumber({
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return number != null
        ? AutoSizeText(
            number.toString(),
            minFontSize: 1,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ).animate().scaleXY(
              curve: Curves.easeInOut,
              begin: 0,
              end: 1,
              duration: const Duration(milliseconds: 200),
            )
        : const SizedBox();
  }
}
