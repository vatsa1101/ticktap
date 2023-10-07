import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ResultWidget extends StatelessWidget {
  final bool? success;

  const ResultWidget({
    required this.success,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return success != null
        ? Center(
            child: AutoSizeText(
              success! ? "Success" : "Try Again !!",
              minFontSize: 1,
              maxLines: 1,
              style: TextStyle(
                color: success! ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ).animate().shake(
                  curve: Curves.easeInOut,
                  hz: 0.5,
                  rotation: 0.3,
                  duration: const Duration(milliseconds: 1000),
                ),
          )
        : const SizedBox();
  }
}
