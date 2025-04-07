import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreTextFormField extends StatelessWidget {
  const StoreTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.validator,
    required this.isValid,
    this.autoValidateMode = AutovalidateMode.onUnfocus
  });

  final TextEditingController controller;
  final String label, hintText;
  final String? Function(String?) validator;

  final bool? isValid;
  final AutovalidateMode autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16.r,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          autovalidateMode: autoValidateMode,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16.r,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            hintStyle: TextStyle(color: AppColors.secondary, fontSize: 16.r),
            errorStyle: TextStyle(
              fontSize: 14.r,
              fontWeight: FontWeight.w500,
            ),
            suffixIconConstraints: BoxConstraints.loose(
              Size(double.infinity, double.infinity),
            ),
            suffixIcon: Visibility.maintain(
              visible: isValid != null ? true : false,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: SvgPicture.asset(
                  "assets/icons/validation_${isValid != null && isValid! ? 'success' : 'error'}.svg",
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            hintText: hintText,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color:
                    isValid != null && isValid!
                        ? AppColors.successGreen
                        : AppColors.secondary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color:
                    isValid != null && isValid!
                        ? AppColors.successGreen
                        : AppColors.secondary,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
