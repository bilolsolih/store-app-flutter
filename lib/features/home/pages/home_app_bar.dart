import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/home/pages/filter_button.dart';
import 'package:store_app/features/home/pages/home_app_bar_category_item.dart';
import 'package:store_app/features/home/pages/search_field.dart';

import '../../common/widgets/store_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 64.h,
      titleSpacing: 24.w,
      title: Text(
        "Discover",
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 32.r,
          fontWeight: FontWeight.w500,
        ),
      ),
      actionsPadding: EdgeInsets.only(right: 16.w),
      actions: [
        StoreIconButton(
          icon: "assets/icons/notification.svg",
          width: 20,
          height: 25,
          callback: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 100.h),
        child: Column(
          spacing: 16,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(child: SearchField()),
                  FilterButton(),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  spacing: 8,
                  children: [
                    HomeAppBarCategoryItem(title: "All", categoryId: null),
                    HomeAppBarCategoryItem(title: "Tshirts", categoryId: null),
                    HomeAppBarCategoryItem(title: "Jeans", categoryId: null),
                    HomeAppBarCategoryItem(title: "Shoes", categoryId: null),
                    HomeAppBarCategoryItem(title: "Hoodies", categoryId: null),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
