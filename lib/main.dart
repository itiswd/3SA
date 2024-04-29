import 'package:sssa/data/colors.dart';
import 'package:sssa/pages/home_page.dart';
import 'package:sssa/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return GetMaterialApp(
      title: '3SA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appbarColor),
        useMaterial3: true,
        fontFamily: 'HONOR',
      ),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      home: prefs.getInt('saveLogin') == 1 ? const HomePage() : const LogIn(),
    );
  }
}
