import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            "assets/images/icon-fit.png",
            height: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          const Flexible(
            child: AutoSizeText(
              "TickTap",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              minFontSize: 1,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
