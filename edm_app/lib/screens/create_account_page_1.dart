import 'package:flutter/material.dart';

class CreateAccountPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateAccountPage1State();
  }
}

class _CreateAccountPage1State extends State<CreateAccountPage1> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  var _controller = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                  text: 'Create account',
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
            decoration: BoxDecoration(color: Colors.black),
            alignment: Alignment.topCenter,
            child: Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.all(50),
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'What\'s your name?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Times New Roman',
                          color: Colors.white),
                    ),
                  ),
                  buildUsernameEmail(),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: 'What\'s your date of birth?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Times New Roman',
                          color: Colors.white),
                    ),
                  ),
                  buildPassword(),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: 'What\'s your pronouns?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Times New Roman',
                          color: Colors.white),
                    ),
                  ),
                  buildPronouns(),
                  const SizedBox(height: 32),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            const EdgeInsets.fromLTRB(100.0, 8.0, 100.0, 8.0),
                        primary: Colors.teal[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: RichText(
                          text: TextSpan(
                            text: 'Continue',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Calibri',
                                color: Colors.white),
                          ),
                          textAlign: TextAlign.center),
                      onPressed: () => '')
                ],
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false);
  }

  Widget buildUsernameEmail() => TextFormField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: 'Enter name',
            border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              onPressed: _controller.clear,
              icon: Icon(Icons.clear),
            )),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPassword() => TextFormField(
      obscureText: _isHidden,
      maxLength: 15,
      decoration: InputDecoration(
        hintText: 'MM/DD/YY',
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        suffix: InkWell(
          onTap: _togglePasswordView,
          child: Icon(
            _isHidden ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      keyboardType: TextInputType.visiblePassword);
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Widget buildPronouns() => TextFormField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: 'she/her/hers, he/him/his, etc.',
            border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              onPressed: _controller.clear,
              icon: Icon(Icons.clear),
            )),
        keyboardType: TextInputType.emailAddress,
      );
}