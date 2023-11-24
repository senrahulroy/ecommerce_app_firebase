import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCommonBtn extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;

  const AppCommonBtn(
      {super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45.h,
        width: double.infinity,
        child: ElevatedButton(onPressed: onPressed, child: Text(btnName)));
  }
}
