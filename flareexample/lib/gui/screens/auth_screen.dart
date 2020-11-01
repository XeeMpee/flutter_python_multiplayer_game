import 'package:flareexample/gui/screens/game_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static String routeName = "AuthScren";
  AuthScreen({Key key}) : super(key: key);

  String __playerName = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            height: 200.0,
            child: Column(
              children: [
                Text("Name"),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: onPlayerNameFileChange,
                          onSaved: (content) {
                            __playerName = content;
                            onPlayerNameFileSaved(context, content);
                          },
                        ),
                        RaisedButton(
                            child: Text("Play"),
                            onPressed: () {
                              _formKey.currentState.save();
                              print("Player $__playerName starts a game.");
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onPlayerNameFileChange(String content) {
    __playerName = content;
  }

  onPlayerNameFileSaved(BuildContext context, String content) {
    Navigator.of(context).pushNamed(
      GameScreen.routeName,
      arguments: GameScreenArguments(
        playerName: __playerName,
      ),
    );
  }
}
