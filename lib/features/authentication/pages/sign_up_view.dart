import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../common/widgets/store_password_form_field.dart';
import '../widgets/store_social_auth_button.dart';
import '../../common/widgets/store_text_button.dart';
import '../../common/widgets/store_text_form_field.dart';
import '../widgets/auth_page_title_and_subtitle.dart';
import '../widgets/sign_up_terms_and_conditions.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool? fullNameValid, emailValid, passwordValid;

  final formKey = GlobalKey<FormState>();

  Color getBackgroundColor() {
    if (fullNameValid == null || emailValid == null || passwordValid == null) {
      return AppColors.primary200;
    }

    if (!fullNameValid! || !emailValid! || !passwordValid!) {
      return AppColors.primary200;
    }

    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 60.h, 24.w, 37.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthPageTitleAndSubtitle(
                title: "Create an account",
                subtitle: "Let's create your account.",
              ),
              SizedBox(height: 24.h),
              StoreTextFormField(
                controller: fullNameController,
                isValid: fullNameValid,
                label: "Full Name",
                hintText: "Enter your full name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    fullNameValid = false;
                    setState(() {});
                    return "This field is required.";
                  }
                  fullNameValid = true;
                  setState(() {});
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              StoreTextFormField(
                controller: emailController,
                isValid: emailValid,
                label: "Email",
                hintText: "Enter your email address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    emailValid = false;
                    setState(() {});
                    return "This field is required.";
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    emailValid = false;
                    setState(() {});
                    return "Enter a valid email address.";
                  }
                  emailValid = true;
                  setState(() {});
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              StorePasswordFormField(
                controller: passwordController,
                isValid: passwordValid,
                label: "Password",
                hintText: "Enter your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    passwordValid = false;
                    setState(() {});
                    return "This field is required.";
                  }
                  passwordValid = true;
                  setState(() {});
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              SignUpTermsAndConditions(),
              SizedBox(height: 24.h),
              StoreTextButton(
                text: "Create an Account",
                width: double.infinity,
                height: 54.h,
                backgroundColor: getBackgroundColor(),
                callback: () {
                  formKey.currentState!.validate();
                },
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.primary100)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.primary100)),
                ],
              ),
              SizedBox(height: 24.h),
              StoreSocialAuthButton(
                icon: "assets/icons/google_logo.svg",
                text: "Sign Up with Google",
                width: double.infinity,
                height: 56.h,
                foregroundColor: AppColors.primary,
                backgroundColor: Colors.white,
                showOutlineBorder: true,
                callback: () {},
              ),
              SizedBox(height: 16.h),
              StoreSocialAuthButton(
                icon: "assets/icons/facebook_logo.svg",
                text: "Sign Up with Facebook",
                width: double.infinity,
                height: 56.h,
                backgroundColor: AppColors.facebookColor,
                callback: () {},
              ),
              Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: AppColors.primary, fontSize: 14.r),
                    children: [
                      TextSpan(
                        text: "Log In",
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () => context.go(Routes.login),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14.r,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
