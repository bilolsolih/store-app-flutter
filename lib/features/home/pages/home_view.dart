import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/connection_state.dart';
import 'package:store_app/core/utils/colors.dart';

import 'home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionStateCubit, AppConnectionState>(
      listener: (context, state) {
        final text = state.isOnline ? "Online bo'ldi" : "Offline bo'ldi";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            HomeAppBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 224.h,
                  crossAxisSpacing: 19.w,
                  mainAxisSpacing: 20.h,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 100,
                  (context, index) => Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 161.w,
                          height: 174.h,
                          child: Stack(
                            children: [
                              Placeholder(),
                              Positioned(
                                top: 12.r,
                                right: 12.r,
                                child: Container(
                                  width: 34.r,
                                  height: 34.r,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFF525252).withValues(alpha: 0.25),
                                        offset: Offset(0, 8.r),
                                        blurRadius: 10.r,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/icons/heart.svg",
                                    width: 18.r,
                                    height: 18.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Regular Fit Slogan",
                          style: TextStyle(color: AppColors.primary, fontSize: 16.r, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$1,190",
                          style: TextStyle(color: AppColors.primary500, fontSize: 12.r, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
