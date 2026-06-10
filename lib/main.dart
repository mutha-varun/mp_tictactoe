import 'package:flutter/material.dart';
import 'package:mp_tictactoe/screens/createroom.dart';
import 'package:mp_tictactoe/screens/joinroom.dart';
import 'package:mp_tictactoe/screens/mainmenu.dart';
import 'package:mp_tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      routes: {
        MainMenu.routeName: (context)=> const MainMenu(),
        Joinroom.routeName: (context)=> const Joinroom(),
        Createroom.routeName: (context)=> const Createroom()
      },
      initialRoute: MainMenu.routeName,
    );
  }
}
