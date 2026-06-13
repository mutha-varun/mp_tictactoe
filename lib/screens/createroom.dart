import 'package:flutter/material.dart';
import 'package:mp_tictactoe/resources/socket_methods.dart';
import 'package:mp_tictactoe/responsive/respsonsive.dart';
import 'package:mp_tictactoe/widgets/custombutton.dart';
import 'package:mp_tictactoe/widgets/customtext.dart';
import 'package:mp_tictactoe/widgets/customtextfield.dart';

class Createroom extends StatefulWidget {
  static String routeName = '/createroom';
  const Createroom({super.key});

  @override
  State<Createroom> createState() => _CreateroomState();
}

class _CreateroomState extends State<Createroom> {
  final _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.createRoomSuccess(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Respsonsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Customtext(shadows: [
                Shadow(
                  blurRadius: 40,
                  color: Colors.blue
                )
              ], 
                text: "Create Room", 
                fontSize: 70
              ),
              SizedBox(height: size.height*0.08,),
              Customtextfield(
                controller: _nameController, 
                text: "Enter your nickname" 
              ),
              SizedBox(height: size.height*0.045,),
              Custombutton(onTap:()=> _socketMethods.createRoom(_nameController.text), text: "Create")
            ],
          ),
        ),
      ),
    );
  }
}