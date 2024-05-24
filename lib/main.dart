import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_crypto/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getx_crypto/pages/home_screen.dart';

void main() async {
  await registerServices();
  await registerControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
              textTheme: GoogleFonts.montserratTextTheme(),
              useMaterial3: true,
            ),
            routes: {"/home": (context) => HomeScreen()},
            initialRoute: "/home",
          );
        });
  }
}
