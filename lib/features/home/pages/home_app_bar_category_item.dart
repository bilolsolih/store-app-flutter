import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class HomeAppBarCategoryItem extends StatelessWidget {
  const HomeAppBarCategoryItem({super.key, required this.title, required this.categoryId});

  final String title;
  final int? categoryId;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: Size(double.infinity, 36),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppColors.primary100, width: 1),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 16.r, fontWeight: FontWeight.w500),
      ),
    );
  }
}
