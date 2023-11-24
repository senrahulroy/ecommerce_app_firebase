import 'package:ecommerceapp_firebase/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TopTitles extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopTitles({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(kToolbarHeight),
        if (title == AppString.strLogin || title == AppString.strCreateAccount)
          GestureDetector(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () => Navigator.of(context).pop(),
          ),
        Gap(10.h),
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.h)),
        Gap(10.h),
        Text(subTitle,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24.h)),
      ],
    );
  }
}
