import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/store_password_form_field.dart';
import '../../common/widgets/store_text_button.dart';
import '../widgets/auth_page_title_and_subtitle.dart';
import '../widgets/store_app_bar_with_back_button.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passwordControllerOne = TextEditingController();
  final passwordControllerTwo = TextEditingController();

  bool? passwordOneValid, passwordTwoValid;

  final formKey = GlobalKey<FormState>();

  Color getBackgroundColor() {
    if (passwordOneValid == null || passwordTwoValid == null) {
      return AppColors.primary200;
    }

    if (!passwordOneValid! || !passwordTwoValid!) {
      return AppColors.primary200;
    }

    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarWithBackButton(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 14.h, 24.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthPageTitleAndSubtitle(
                title: "Reset Password",
                subtitle: "Set the new password for your account so you can login and access all the features.",
              ),
              SizedBox(height: 24.h),
              StorePasswordFormField(
                controller: passwordControllerOne,
                isValid: passwordOneValid,
                label: "Password",
                hintText: "Enter your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    passwordOneValid = false;
                    setState(() {});
                    return "This field is required.";
                  }
                  passwordOneValid = true;
                  setState(() {});
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              StorePasswordFormField(
                controller: passwordControllerTwo,
                isValid: passwordTwoValid,
                label: "Confirm Password",
                hintText: "Repeat your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    passwordTwoValid = false;
                    setState(() {});
                    return "This field is required.";
                  }
                  passwordTwoValid = true;
                  setState(() {});
                  return null;
                },
              ),
              Spacer(),
              StoreTextButton(
                text: "Continue",
                width: double.infinity,
                height: 54.h,
                backgroundColor: getBackgroundColor(),
                callback: () {
                  formKey.currentState!.validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
