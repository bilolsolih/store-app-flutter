import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class SignUpTermsAndConditions extends StatelessWidget {
  const SignUpTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "By signing up you agree to our ",
        style: TextStyle(color: AppColors.primary, fontSize: 14.r),
        children: [
          TextSpan(
            text: "Terms",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14.r,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ", ",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14.r,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14.r,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ", ",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14.r,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "and ",
            style: TextStyle(color: AppColors.primary, fontSize: 14.r),
          ),
          TextSpan(
            text: "Cookie Use",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14.r,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
