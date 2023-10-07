import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SuccessfulTaps extends StatelessWidget {
  final int count;
  const SuccessfulTaps({
    required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: AutoSizeText(
            "Successful Taps",
            minFontSize: 1,
            maxLines: 1,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: AutoSizeText(
            count.toString(),
            minFontSize: 1,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
