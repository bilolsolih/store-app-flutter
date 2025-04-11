import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../common/widgets/store_icon_button.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search for clothes...",
        hintStyle: TextStyle(color: AppColors.primary400, fontSize: 16.r),
        constraints: BoxConstraints.tight(Size(double.infinity, 52.h)),
        suffixIconConstraints: BoxConstraints.loose(Size(50.w, 52.h)),
        suffixIcon: Align(
          alignment: Alignment.centerLeft,
          child: StoreIconButton(
            icon: "assets/icons/microphone.svg",
            width: 24,
            height: 24,
            callback: () {},
          ),
        ),
        prefixIconConstraints: BoxConstraints.loose(Size(44.w, 24)),
        prefixIcon: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            "assets/icons/search.svg",
            width: 24,
            height: 24,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppColors.primary300,
              BlendMode.srcIn,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary300),
        ),
      ),
      focusNode: focusNode,
      onTapOutside: (event) => focusNode.unfocus(),
    );
  }
}
