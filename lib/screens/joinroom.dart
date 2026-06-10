import 'package:flutter/material.dart';
import 'package:mp_tictactoe/responsive/respsonsive.dart';
import 'package:mp_tictactoe/widgets/custombutton.dart';
import 'package:mp_tictactoe/widgets/customtext.dart';
import 'package:mp_tictactoe/widgets/customtextfield.dart';

class Joinroom extends StatefulWidget {
  static String routeName = '/joinroom';
  const Joinroom({super.key});

  @override
  State<Joinroom> createState() => _JoinroomState();
}

class _JoinroomState extends State<Joinroom> {

  final _nameController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _codeController.dispose();
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
                text: "Join Room", 
                fontSize: 70
              ),
              SizedBox(height: size.height*0.08,),
              Customtextfield(
                controller: _nameController, 
                text: "Enter your nickname" 
              ),
              SizedBox(height:22,),
              Customtextfield(
                controller: _codeController, 
                text: "Enter room code" 
              ),
              SizedBox(height: size.height*0.045,),
              Custombutton(onTap: (){}, text: "Join")
            ],
          ),
        ),
      ),
    );
  }
}