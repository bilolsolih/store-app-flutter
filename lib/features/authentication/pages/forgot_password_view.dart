import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/store_text_button.dart';
import '../../common/widgets/store_text_form_field.dart';
import '../widgets/auth_page_title_and_subtitle.dart';
import '../widgets/store_app_bar_with_back_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();

  bool? emailValid;

  final formKey = GlobalKey<FormState>();


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
                title: "Forgot password",
                subtitle:
                    "Enter your email for the verification process. We will send 4 digits code to your email.",
              ),
              SizedBox(height: 24.h),
              StoreTextFormField(
                controller: emailController,
                isValid: emailValid,
                autoValidateMode: AutovalidateMode.disabled,
                label: "Email",
                hintText: "Enter your email address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    emailValid = false;
                    return "This field is required.";
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    emailValid = false;
                    return "Enter a valid email address.";
                  }
                  emailValid = true;
                  return null;
                },
              ),
              Spacer(),
              StoreTextButton(
                text: "Send Code",
                width: double.infinity,
                height: 54.h,
                backgroundColor: AppColors.primary,
                callback: () {
                  formKey.currentState!.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
