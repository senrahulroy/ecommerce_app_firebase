import 'dart:async';
import 'package:ecommerceapp_firebase/ui/screen/internet_screen/internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker extends StatefulWidget {
  final Widget child;
  const InternetChecker({super.key, required this.child});

  @override
  State<InternetChecker> createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          isConnected = false;
        });
      } else {
        setState(() {
          isConnected = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  Future<void> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isConnected ? widget.child : const InternetOffScreen();
  }
}
