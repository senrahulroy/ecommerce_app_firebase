
import 'package:ecommerceapp_firebase/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';


class InternetOffScreen extends StatefulWidget {
  const InternetOffScreen({super.key});

  @override
  State<InternetOffScreen> createState() => _InternetOffScreenState();
}

class _InternetOffScreenState extends State<InternetOffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width:  200,
              child: Lottie.asset(AppAssets.internetJson),),

            Gap(10.h,color: Colors.red,),
            const Text(
              'No internet connection',
              style: TextStyle(fontSize: 24,color: Colors.red),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

