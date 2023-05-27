import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/config/app_router.dart';
import 'package:flutter_ecommerce_app/src/pages/main/mainPage.dart';
import 'package:flutter_ecommerce_app/src/pages/product/product_detail.dart';
import 'package:flutter_ecommerce_app/src/widgets/customRoute.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-Commerce ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
    );
  }
}
