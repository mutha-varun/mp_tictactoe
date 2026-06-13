import 'package:flutter/material.dart';
import 'package:mp_tictactoe/provider/roomdata.dart';
import 'package:mp_tictactoe/resources/socket_client.dart';
import 'package:mp_tictactoe/screens/gamescreen.dart';
import 'package:mp_tictactoe/utils/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient;
  void createRoom(String nickname){
    if(nickname.isNotEmpty){
      _socketClient.emit("createRoom", 
        {
          'nickname': nickname
        }
      );
    }
  }

  void joinRoom (String nickname, String roomID){
    if(nickname.isNotEmpty && roomID.isNotEmpty){
      _socketClient.emit("joinRoom",{
        "nickname": nickname,
        "roomID": roomID
      });
    }
  }

  void tapGrid(int index, String roomID, List<String> displayElements){
    if(displayElements[index] == ''){
       _socketClient.emit("tap", {
        'index': index,
        'roomID': roomID
       });
    }
  }


  void createRoomSuccess(BuildContext context){
    _socketClient.on("createRoomSuccess", (room){
      if(!context.mounted) return;
      Provider.of<Roomdata>(context, listen: false).updateRoomData(room);
      Navigator.pushNamed(context, Gamescreen.routeName);
    });
  }

  void joinRoomSuccess(BuildContext context){
    _socketClient.on("joinSuccess", (room){
      if(!context.mounted) return;
      Provider.of<Roomdata>(context, listen: false).updateRoomData(room);
      Navigator.pushNamed(context, Gamescreen.routeName);
    });
  }

  void errorOccured(BuildContext context){
    _socketClient.on("errorOccurred", (data){
      if(!context.mounted) return;
      showSnackBar(context, data.toString());
    });
  }

  void updatePlayersState(BuildContext context){
    _socketClient.on("updatePlayers", (playerData){
      if(!context.mounted) return;
      Provider.of<Roomdata>(context, listen: false).updatePlayer1(playerData[0]);
     
      Provider.of<Roomdata>(context, listen: false).updatePlayer2(playerData[1]);
    });
  }

  void updateRoom(BuildContext context){
    _socketClient.on("updateRoom", (room){
      Provider.of<Roomdata>(context, listen: false).updateRoomData(room);

    });
  }

  void tapped(BuildContext context){
    _socketClient.on("tapped", (data){
        Roomdata roomdata = Provider.of<Roomdata>(context, listen: false);
        roomdata.updateDisplayElements(data['index'], data['choice']);
        roomdata.updateRoomData(data['room']);  
    });

    
  }
}
