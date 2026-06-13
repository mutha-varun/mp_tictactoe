import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mp_tictactoe/provider/roomdata.dart';
import 'package:mp_tictactoe/widgets/customtextfield.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {


  @override
  Widget build(BuildContext context) {
    final id = Provider.of<Roomdata>(context).roomData['_id'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Waiting for a player to join",
          style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: id));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Room ID copied to clipboard')),
            );
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(id,
              style:const TextStyle(fontSize: 20),
            ),
          ),
        )
        
      ],
    );
  }
}