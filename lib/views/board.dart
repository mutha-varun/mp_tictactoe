import 'package:flutter/material.dart';
import 'package:mp_tictactoe/provider/roomdata.dart';
import 'package:mp_tictactoe/resources/socket_methods.dart';
import 'package:provider/provider.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final SocketMethods _socketMethods = SocketMethods();

  void tapped(int index, Roomdata roomData){
    _socketMethods.tapGrid(index, roomData.roomData['_id'], roomData.displayElements);
  } 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.tapped(context);
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    Roomdata roomdata = Provider.of<Roomdata>(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height*0.7,
        maxWidth: 500
      ),
      child: AbsorbPointer(
        absorbing: roomdata.roomData['turn']['socketId'] != _socketMethods.socketClient.id,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: ()=> tapped(index, roomdata),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white24
                  )
                ),
                child: Center(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    child: Text(roomdata.displayElements[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        shadows: [
                          Shadow(
                            blurRadius: 40,
                            color: roomdata.displayElements[index] == 'O'? Colors.red : Colors.blue
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}