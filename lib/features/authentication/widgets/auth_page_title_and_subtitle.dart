import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class AuthPageTitleAndSubtitle extends StatelessWidget {
  const AuthPageTitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 32.r,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.secondary,
            fontSize: 16.r,
            letterSpacing: -0.05,
          ),
        ),
      ],
    );
  }
}
