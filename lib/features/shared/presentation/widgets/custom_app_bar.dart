import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    title: Image.asset(
      'assets/images/logo.png',
      height: 41,
      width: 43,
    ),
    centerTitle: true,
  );
}
