import 'package:ecommerceapp_firebase/constants/app_assets.dart';
import 'package:ecommerceapp_firebase/constants/app_rounts.dart';
import 'package:ecommerceapp_firebase/constants/app_strings.dart';
import 'package:ecommerceapp_firebase/constants/widgets/app_common_btn.dart';
import 'package:ecommerceapp_firebase/constants/widgets/app_top_titles.dart';
import 'package:ecommerceapp_firebase/ui/screen/auth_screen/login_screen/login_screen.dart';
import 'package:ecommerceapp_firebase/ui/screen/auth_screen/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Login Top Welcome
              const TopTitles(title: AppString.strWelcome, subTitle: AppString.strBuyAnyItemFromUsingApp),
              /// Main Lottie Animation
              Lottie.asset(
                AppAssets.welcomeJson,
                fit: BoxFit.fill,
              ),

              /// Social Medial Login
              const Center(
                child: Text(AppString.strSocialMediaLogin),
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    AppAssets.googleJson,
                    fit: BoxFit.fill,
                    height: 55.h,
                    width: 55.w,
                  ),
                  Lottie.asset(
                    AppAssets.facebookJson,
                    fit: BoxFit.fill,
                    height: 55.h,
                    width: 55.w,
                  ),
                ],
              ),
              Gap(15.h),
              Divider(thickness: 3.h,color: Colors.green,),
              Gap(15.h),
              /// Other Login
              AppCommonBtn(btnName: AppString.strLogin, onPressed: () {
                Routes.instance.push(const LoginScreen(), context);
              }),
              Gap(15.h),
              AppCommonBtn(btnName: AppString.strSignUP, onPressed: () {
                Routes.instance.push(const SignUpScreen(), context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
