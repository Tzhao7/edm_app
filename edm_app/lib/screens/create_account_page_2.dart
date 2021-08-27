import 'package:flutter/material.dart';
import 'package:edm_app/icons/custom_icons_icons.dart';

class CreateAccountPage2 extends StatelessWidget {
  void connectPressed() {
    print('Connect Pressed.');
  }

  void skipPressed() {
    print('Skip Pressed.');
  }

  @override
  Widget build(BuildContext context) {
    var titleText = ['Create account', 'Spotify'];
    String mainText =
        '''Link your PLURAL account to Spotify to get\nupcoming event recommendations based on\nthe artists you listen to.''';
    var buttonText = ['Connect', 'Skip'];
    Icon spotify = Icon(
      CustomIcons.spotify,
      size: 30.0,
    );
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            leading: Icon(Icons.arrow_back_outlined),
            bottom: PreferredSize(
                child: Container(color: Colors.grey, height: 3.0),
                preferredSize: Size.fromHeight(3.0)),
            centerTitle: true,
            title: RichText(
              text: TextSpan(
                text: titleText[0],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Times New Roman',
                    color: Colors.white),
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          height: 210,
          decoration: BoxDecoration(color: Colors.grey[850]),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      Icon(CustomIcons.spotify, size: 30, color: Colors.white),
                      SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: titleText[1],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Times New Roman',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                        text: mainText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Times New Roman',
                            color: Colors.white),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.fromLTRB(100.0, 4.0, 100.0, 4.0),
                      primary: Colors.blueAccent[700],
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: connectPressed,
                    child: Text(
                      buttonText[0],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.fromLTRB(120.0, 8.0, 120.0, 8.0),
                      primary: Colors.blueAccent[700],
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: skipPressed,
                    child: Text(
                      buttonText[1],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
