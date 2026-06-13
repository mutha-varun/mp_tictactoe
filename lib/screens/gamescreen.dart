import 'package:flutter/material.dart';
import 'package:mp_tictactoe/provider/roomdata.dart';
import 'package:mp_tictactoe/resources/socket_methods.dart';
import 'package:mp_tictactoe/views/board.dart';
import 'package:mp_tictactoe/views/scoreboard.dart';
import 'package:mp_tictactoe/widgets/waitinglobby.dart';
import 'package:provider/provider.dart';

class Gamescreen extends StatefulWidget {
  static String routeName = '/game';
  const Gamescreen({super.key});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {

  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoom(context);
    _socketMethods.updatePlayersState(context);
  } 
  
  @override
  Widget build(BuildContext context) {
    Roomdata roomdataProvider = Provider.of<Roomdata>(context);

    
    return Scaffold(
      body:  roomdataProvider.roomData['isJoin']?const WaitingLobby() 
      : SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Scoreboard(),
            Board(),
            Text('${roomdataProvider.roomData['turn']['nickname']}\'s turn',
              style: const TextStyle(
                fontSize: 20
              ),
            )
          ],
        )
      ),
    );
    
   
  }
}