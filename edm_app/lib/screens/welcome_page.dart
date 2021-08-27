import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  void loginPressed() {
    print('Login Pressed.');
  }

  void registerPressed() {
    print('Register Pressed.');
  }

  @override
  Widget build(BuildContext context) {
    var titleText = ['P L U R A L', 'Bringing the EDM events you love, to YOU'];
    var buttonText = ['Login', 'Get Started'];
    Color Color1 = Color(0xffEB0000);
    Color Color2 = Color(0xffFF8F3E);
    Color Color3 = Color(0xffFF0000);
    Color Color4 = Color(0xff770080);
    Color Color5 = Color(0xff0400F3);
    Color Color6 = Color(0xff0100EC);
    Color Color7 = Color(0xff3568FF);
    Color Color8 = Color(0xff49BEFF);
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color1,
              Color2,
              Color3,
              Color4,
              Color5,
              Color6,
              Color7,
              Color8
            ],
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 6),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'images/brandon-erlinger-ford-wZnH3isZNkw-unsplash.jpg')),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: RichText(
                  text: TextSpan(
                    text: titleText[0],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Courier',
                        color: Colors.white),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                height: 10,
                thickness: 5,
                indent: 100,
                endIndent: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(64.0, 8.0, 64.0, 8.0),
                child: RichText(
                  text: TextSpan(
                    text: titleText[1],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Courier',
                        color: Colors.white),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(125.0, 8.0, 125.0, 8.0),
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login', arguments: null);
                },
                child: Text(
                  buttonText[0],
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(100.0, 8.0, 100.0, 8.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/create_account', arguments: null);
                },
                child: Text(
                  buttonText[1],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
