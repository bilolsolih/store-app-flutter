import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/widgets/store_icon_button.dart';

class StoreAppBarWithBackButton extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBarWithBackButton({super.key, this.toolbarHeight = 64});

  final double toolbarHeight;

  @override
  Size get preferredSize => Size(double.infinity, toolbarHeight.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: StoreIconButton(
            icon: "assets/icons/back_arrow.svg",
            width: 19.w,
            height: 16.h,
            callback: () => context.pop(),
          ),
        ),
      ),
      toolbarHeight: toolbarHeight.h,
    );
  }
}
