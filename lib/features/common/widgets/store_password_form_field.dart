import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_icon_button.dart';

class StorePasswordFormField extends StatefulWidget {
  const StorePasswordFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.validator,
    required this.isValid,
  });

  final TextEditingController controller;
  final String label, hintText;
  final String? Function(String?) validator;
  final bool? isValid;

  @override
  State<StorePasswordFormField> createState() => _StorePasswordFormFieldState();
}

class _StorePasswordFormFieldState extends State<StorePasswordFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16.r,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUnfocus,
          obscureText: !showPassword,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16.r,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.secondary, fontSize: 16),
            errorStyle: TextStyle(fontSize: 14.r, fontWeight: FontWeight.w500),
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
                widget.isValid != null && widget.isValid!
                    ? AppColors.successGreen
                    : AppColors.secondary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color:
                widget.isValid != null && widget.isValid!
                    ? AppColors.successGreen
                    : AppColors.secondary,
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIconConstraints: BoxConstraints.loose(
              Size(double.infinity, double.infinity),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                crossFadeState:
                    showPassword
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                firstChild: StoreIconButton(
                  icon: "assets/icons/hide_password.svg",
                  width: 20.w,
                  height: 20.h,
                  callback: () => setState(() => showPassword = !showPassword),
                ),
                secondChild: StoreIconButton(
                  icon: "assets/icons/show_password.svg",
                  width: 15.w,
                  height: 15.h,
                  callback: () => setState(() => showPassword = !showPassword),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
