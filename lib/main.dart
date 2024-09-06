import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_applecitne/scrense/tape_screen.dart';
import '../scrense/categore_treps_screne.dart';
import '../scrense/trip_detal_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English
      ],
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 13, 194, 154),
        fontFamily: "font1",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontFamily: "font1",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      // home: catogarseScrene(),
      routes: {
        '/': (ctx) => tapeScreen(),
        CategoryTrepsScrene.screenRote: (ctx) => CategoryTrepsScrene(),
        tripDetalScreen.screenRoute: (ctx) => tripDetalScreen(),
      },
    );
  }
}
