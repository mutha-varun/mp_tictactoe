import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mp_tictactoe/provider/roomdata.dart';
import 'package:mp_tictactoe/screens/createroom.dart';
import 'package:mp_tictactoe/screens/gamescreen.dart';
import 'package:mp_tictactoe/screens/joinroom.dart';
import 'package:mp_tictactoe/screens/mainmenu.dart';
import 'package:mp_tictactoe/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Roomdata(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
        routes: {
          MainMenu.routeName: (context)=> const MainMenu(),
          Joinroom.routeName: (context)=> const Joinroom(),
          Createroom.routeName: (context)=> const Createroom(),
          Gamescreen.routeName: (context)=> const Gamescreen()
        },
        initialRoute: MainMenu.routeName,
      ),
    );
  }
}
