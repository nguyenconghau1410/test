import 'dart:async';
import 'dart:io';
import 'package:apppayv1/storage/app_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
        ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
    ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDvKRZ99phhFz17IjlBYZqNge6r9K9us7I",
          appId: "1:1082419526002:android:274dd1267a9845e953c5eb",
          messagingSenderId: "1082419526002",
          projectId: "aicoju-payment",
          storageBucket: "aicoju-payment.appspot.com"
      )
    )
    : await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDwamHDD6IRdYzaR5dIRuRDLd0ryN_J5xg",
          appId: "1:1082419526002:ios:a0a3f6b8c088ee7f53c5eb",
          messagingSenderId: "1082419526002",
          projectId: "aicoju-payment",
          storageBucket: "aicoju-payment.appspot.com"
      )
    );
  await AppPreferences().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
            () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen())
          );
        }
    );
    return Scaffold(
      backgroundColor: const Color(0xFF2FA2B9),
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(20)
          ),
          child: Image.asset(
            "images/image1.jpg",
            width: 196,
            height: 209,
          ),
        ),
      ),
    );
  }
}


