import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/authentication/pages/store_app_bar_with_back_button.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/store_text_button.dart';
import '../widgets/auth_page_title_and_subtitle.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({super.key, required this.emailAddress});

  final String emailAddress;

  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(numOfDigits, (_) => FocusNode());
    controllers = List.generate(numOfDigits, (_) => TextEditingController());
  }

  Color getBackgroundColor() {
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        return AppColors.primary200;
      }
    }
    return AppColors.primary;
  }

  final int numOfDigits = 4;

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
                title: "Enter 4 Digit Code",
                subtitle:
                    "Enter 4 digit code that your receive on your email (${widget.emailAddress}).",
              ),
              SizedBox(height: 24.h),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  numOfDigits,
                  (index) => TextFormField(
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 32.r,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter(
                        RegExp(r"[0-9]"),
                        allow: true,
                      ),
                    ],
                    onChanged: (value) {
                      if (value.isNotEmpty && index != numOfDigits - 1) {
                        focusNodes[index + 1].requestFocus();
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      constraints: BoxConstraints.tight(Size(64.w, 60.h)),
                      counter: SizedBox.shrink(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary100),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(color: AppColors.primary, fontSize: 14.r),
                    children: [
                      TextSpan(
                        text: "Resend code",
                        recognizer: TapGestureRecognizer(),
                        // ..onTap = () => context.go(Routes.signUp),
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
