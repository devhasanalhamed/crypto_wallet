import 'package:crypto_wallet/app/view/screen/homepage.dart';
import 'package:crypto_wallet/core/utils/register_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await registerServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      routes: {
        '/home': (context) => const Homepage(),
      },
      initialRoute: '/home',
    );
  }
}
