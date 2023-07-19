//pages

import 'package:chatify/pages/login_page.dart';
import 'package:chatify/pages/splash_page.dart';
import 'pages/home_page.dart';
import './pages/register_page.dart';

// providers
import 'package:chatify/providers/authentication_provider.dart';

//services
import 'package:chatify/services/navigation_service.dart';

//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SplashPage(
    key: UniqueKey(),
    onInitializationComplete: () {
      runApp(
        MainApp(),
      );
    },
  ));
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _context){
            return AuthenticationProvider();
          }
          )
      ],
      child: MaterialApp(
        title: "Chatify",
        theme: ThemeData(
          backgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
          scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: const Color.fromRGBO(30, 29, 37, 1.0),
          )
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          "/login": (BuildContext _context) => LoginPage(),
          "/home": (BuildContext _context) => HomePage(),
          "/register":(BuildContext _context) => RegisterPage() 
        },
      ),
    );
  }
}