// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceapp_firebase/constants/app_assets.dart';
import 'package:ecommerceapp_firebase/constants/app_rounts.dart';
import 'package:ecommerceapp_firebase/constants/app_strings.dart';
import 'package:ecommerceapp_firebase/constants/const.dart';
import 'package:ecommerceapp_firebase/constants/widgets/app_common_btn.dart';
import 'package:ecommerceapp_firebase/constants/widgets/app_common_inpute_field.dart';
import 'package:ecommerceapp_firebase/constants/widgets/app_top_titles.dart';
import 'package:ecommerceapp_firebase/helper/firebase_auth/firebae_auth_helper.dart';
import 'package:ecommerceapp_firebase/ui/screen/auth_screen/login_screen/login_screen.dart';
import 'package:ecommerceapp_firebase/ui/screen/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const TopTitles(
                  title: AppString.strCreateAccount,
                  subTitle: AppString.strWelcomeBackToECommerceApp),
              Center(
                child: Lottie.asset(
                  AppAssets.signUpJson,
                  height: 200.h,
                ),
              ),

              /// Enter Name email , phone & Password
                CommonTextField(
                controller: userNameController,
                labelText: AppString.strName,
                keyboardType: TextInputType.name,
                hintText: AppString.strEnterYourName,
                prefixIcon: Icon(Icons.person_outline),
              ),
              Gap(20.h),
                CommonTextField(
                  controller: emailController,
                keyboardType: TextInputType.emailAddress,
                labelText: AppString.strEmail,
                hintText: AppString.strEnterHereEmail,
                prefixIcon: Icon(Icons.email_outlined),
              ),
              Gap(20.h),
               CommonTextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                labelText: AppString.strPhone,
                hintText: AppString.strEnterYourNumber,
                prefixIcon: Icon(Icons.call),
              ),
              Gap(20.h),
              CommonTextField(
                controller: passwordController,
                labelText: AppString.strPassword,
                hintText: AppString.strEnterHerePassword,
                prefixIcon: const Icon(Icons.security),
                obscureText: isVisible,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => isVisible = !isVisible);
                    },
                    icon: isVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                suffixIconColor: Colors.red,
              ),
              Gap(40.h),

              ///login button
              AppCommonBtn(btnName: AppString.strCreateAccount, onPressed: () async {
                bool isValidation = signUpValidation(emailController.text, passwordController.text, userNameController.text, phoneController.text
                );
                if (isValidation) {
                  bool isLogin = await FirebaseAuthHelper.instance.signUp(emailController.text, passwordController.text, context);
                  if (isLogin) {
                    Routes.instance.pushAndRemoveUntil(const HomeScreen(), context);
                  }else{

                  }
                }
              }),
              Gap(20.h),
              Center(child:Text(AppString.strAllReadyHaveAccount,style: TextStyle(fontSize: 15.h,fontWeight: FontWeight.normal))),
              Gap(10.h),
              Center(child: CupertinoButton(child: Text(AppString.strLogin,style: TextStyle(color: Theme.of(context).primaryColor),), onPressed: (){
                Routes.instance.pushReplacement(const LoginScreen(), context);
              })),
            ],
          ),
        ),
      ),
    );
  }
}
