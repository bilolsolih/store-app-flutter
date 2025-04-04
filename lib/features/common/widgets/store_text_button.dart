import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreTextButton extends StatelessWidget {
  const StoreTextButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.callback,
    this.fontSize = 16,
    this.showArrow = false,
  });

  final String text;
  final double width, height, fontSize;
  final bool showArrow;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          onPressed: callback,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide.none,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (showArrow) SvgPicture.asset("assets/icons/right_arrow.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
