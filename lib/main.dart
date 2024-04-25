import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'config/providers/providers.dart';
import 'config/routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        title: 'Crypto View',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0747A1).withOpacity(0.2)),
          useMaterial3: true,
          inputDecorationTheme:  InputDecorationTheme(
            fillColor: Colors.white,
            focusColor: Colors.white,
            border:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
