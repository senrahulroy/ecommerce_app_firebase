import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void appToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: Colors.red),
              Gap(10.h),
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Text('Loading....'),
              )
            ],
          ),
        );
      },
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email is already in use on different account";
    case "ERROR_INVALID_EMAIL":
      return "Your email address appears to be malformed.";
    case "ERROR_WRONG_PASSWORD":
      return "Your password is wrong.";
    case "ERROR_USER_NOT_FOUND":
      return "User with this email doesn't exist.";
    case "ERROR_USER_DISABLED":
      return "User with this email has been disabled.";
    case "ERROR_TOO_MANY_REQUESTS":
      return "Too many requests. Try again later.";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Signing in with Email and Password is not enabled.";
    case "ERROR_WEAK_PASSWORD":
      return "Your password is too weak";
    case "user-not-found":
      return "User are note found";

    default:
      return "An undefined Error happened.";
  }
}

bool loginValidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    appToast('All field are empty');
    return false;
  } else if (email.isEmpty) {
    appToast('Email is empty');
    return false;
  } else if (password.isEmpty) {
    appToast('Password is empty');
    return false;
  } else {
    return true;
  }
}

bool signUpValidation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    appToast('All field are empty');
    return false;
  } else if (name.isEmpty) {
    appToast('Name is empty');
    return false;
  } else if (phone.isEmpty) {
    appToast('Phone is empty');
    return false;
  } else if (email.isEmpty) {
    appToast('Email is empty');
    return false;
  } else if (password.isEmpty) {
    appToast('Password is empty');
    return false;
  } else {
    return true;
  }
}
