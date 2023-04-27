import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:BookMate/screens/login/login.dart';
//import 'package:BookMate/screens/signup/register.dart';
import 'package:provider/provider.dart';

import 'providers/books_provider.dart';
import 'routes.dart';
import 'screens/home_screen/home_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HasperEbook());
}

class HasperEbook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Books(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookMate',
        theme: theme(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            }

            return const MyLogin();
          },
        ),
        routes: routes(),
      ),
    );
  }
}
