import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreSocialAuthButton extends StatelessWidget {
  const StoreSocialAuthButton({
    super.key,
    required this.icon,
    required this.text,
    required this.width,
    required this.height,
    required this.callback,
    this.fontSize = 16,
    this.showOutlineBorder = false,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = Colors.white,
  });

  final String icon, text;
  final double width, height, fontSize;
  final bool showOutlineBorder;

  final Color foregroundColor, backgroundColor;

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
              side:
                  showOutlineBorder
                      ? BorderSide(color: AppColors.primary200)
                      : BorderSide.none,
            ),
            backgroundColor: backgroundColor,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              Text(
                text,
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
