import 'package:flutter/material.dart';
import 'package:mp_tictactoe/responsive/respsonsive.dart';
import 'package:mp_tictactoe/screens/createroom.dart';
import 'package:mp_tictactoe/screens/joinroom.dart';
import 'package:mp_tictactoe/widgets/custombutton.dart';

class MainMenu extends StatelessWidget {
  static String routeName = '/mainmenu';
  const MainMenu({super.key});

  void createRoom(BuildContext context){
    Navigator.pushNamed(context, Createroom.routeName);
  }
  void joinRoom(BuildContext context){
    Navigator.pushNamed(context, Joinroom.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Respsonsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Custombutton(onTap: ()=>createRoom(context), text: "Create Room"),
            const SizedBox(height: 20,),
            Custombutton(onTap: ()=> joinRoom(context), text: "Join Room")
          ],
        ),
      ),
    );
  }
}