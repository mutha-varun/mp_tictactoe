import 'package:flutter/material.dart';
import 'package:mp_tictactoe/provider/roomdata.dart';
import 'package:provider/provider.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    Roomdata roomdataProvider = Provider.of<Roomdata>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(roomdataProvider.player1.nickname,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold   
                ),
              ),
              Text(roomdataProvider.player1.points.toInt().toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold   
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(roomdataProvider.player2.nickname,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold   
                ),
              ),
              Text(roomdataProvider.player2.points.toInt().toString(),
                style: const TextStyle(
                  fontSize: 18,  
                  fontWeight: FontWeight.bold   
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}