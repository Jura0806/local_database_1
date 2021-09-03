import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_database_1/pages/account_page.dart';
import 'package:local_database_1/pages/home_page.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("HiveBox");
  await Hive.openBox("SignIn");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.lexendDecaTextTheme(
        ),
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        AccountPage.id: (context) => AccountPage(),
      },
    );
  }
}
