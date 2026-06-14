import 'package:flutter/widgets.dart';
import 'package:mp_tictactoe/provider/roomdata.dart';
import 'package:mp_tictactoe/utils/gamedialouge.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class GameMethods {

  // @codescene(disable:"Complex Method", disable:"Bumpy Road Ahead")
  // @codescene(disable: "Large Method")
  // @codescene(disable: "Complex Conditional")

  void checkWinner(BuildContext context, Socket socketClient){
    
    Roomdata roomdata = Provider.of<Roomdata>(context, listen: false);

    String winner = '';
    if(roomdata.displayElements[0]==roomdata.displayElements[1] &&
      roomdata.displayElements[0] == roomdata.displayElements[2] &&
      roomdata.displayElements[1] == roomdata.displayElements[2] &&
      roomdata.displayElements[0] != '')
    {
      winner = roomdata.displayElements[0];
    }

    if(roomdata.displayElements[3]==roomdata.displayElements[4] &&
      roomdata.displayElements[3] == roomdata.displayElements[5] &&
      roomdata.displayElements[4] == roomdata.displayElements[5] &&
      roomdata.displayElements[3] != '')
    {
      winner = roomdata.displayElements[3];
    }
    if(roomdata.displayElements[6]==roomdata.displayElements[7] &&
      roomdata.displayElements[6] == roomdata.displayElements[8] &&
      roomdata.displayElements[7] == roomdata.displayElements[8] &&
      roomdata.displayElements[6] != '')
    {
      winner = roomdata.displayElements[6];
    }
    
    if(roomdata.displayElements[0]==roomdata.displayElements[3] &&
      roomdata.displayElements[0] == roomdata.displayElements[6] &&
      roomdata.displayElements[3] == roomdata.displayElements[6] &&
      roomdata.displayElements[0] != '')
    {
      winner = roomdata.displayElements[0];
    }
    if(roomdata.displayElements[1]==roomdata.displayElements[4] &&
      roomdata.displayElements[1] == roomdata.displayElements[7] &&
      roomdata.displayElements[4] == roomdata.displayElements[7] &&
      roomdata.displayElements[0] != '')
    {
      winner = roomdata.displayElements[4];
    }

    if(roomdata.displayElements[2]==roomdata.displayElements[5] &&
      roomdata.displayElements[2] == roomdata.displayElements[8] &&
      roomdata.displayElements[5] == roomdata.displayElements[8] &&
      roomdata.displayElements[2] != '')
    {
      winner = roomdata.displayElements[2];
    }
    
    if(roomdata.displayElements[0]==roomdata.displayElements[4] &&
      roomdata.displayElements[0] == roomdata.displayElements[8] &&
      roomdata.displayElements[4] == roomdata.displayElements[8] &&
      roomdata.displayElements[0] != '')
    {
      winner = roomdata.displayElements[0];
    }
    if(roomdata.displayElements[2]==roomdata.displayElements[4] &&
      roomdata.displayElements[2] == roomdata.displayElements[6] &&
      roomdata.displayElements[4] == roomdata.displayElements[6] &&
      roomdata.displayElements[0] != '')
    {
      winner = roomdata.displayElements[2];
    }
    if(roomdata.filledBoxes == 9){
      winner = '';
      showGameDialog(context, "Draw");
    }
    
    if(winner != ''){
      if(roomdata.player1.playerType == winner){
        showGameDialog(context, "${roomdata.player1.nickname} won");
        socketClient.emit('winner',{
          'winnerSocketId': roomdata.player1.socketId,
          'roomID': roomdata.roomData['_id']
        });

      }
      else{
        showGameDialog(context, "${roomdata.player2.nickname} won");
        socketClient.emit('winner',{
          'winnerSocketId': roomdata.player2.socketId,
          'roomID': roomdata.roomData['_id']
        });
      }
    }
  }

  void clearBoard(BuildContext context){
    Roomdata roomdata = Provider.of<Roomdata>(context, listen: false);
    roomdata.clearBoard();
  }

 
}