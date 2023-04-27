import 'package:flutter/material.dart';
import 'package:BookMate/screens/login/login.dart';
import 'package:BookMate/screens/signup/register.dart';

import 'screens/all_book_screen/all_book_screen.dart';
import 'screens/book_details_screen/book_details_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/pdf_screen.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (_) => HomeScreen(),
    AllBookScreen.routeName: (_) => AllBookScreen(),
    BookDetailsScreen.routeName: (_) => BookDetailsScreen(),
    PDFScreen.routeName: (_) => PDFScreen(),
    MyLogin.routeName: (_) => MyLogin(),
    MyRegister.routeName: (_) => MyRegister(),
  };
}
