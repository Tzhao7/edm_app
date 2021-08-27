import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaymentMethodPageState();
  }
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
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
              leading: Row(children: [
                Icon(Icons.arrow_back_ios),
                SizedBox(width: 5),
                RichText(
                    text: TextSpan(
                        text: 'Edit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            fontFamily: 'Times New Roman',
                            color: Colors.white)))
              ]),
              bottom: PreferredSize(
                  child: Container(color: Colors.grey, height: 3.0),
                  preferredSize: Size.fromHeight(3.0)),
              centerTitle: true,
              title: RichText(
                text: TextSpan(
                  text: 'Payment Method',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
                padding: EdgeInsets.all(40),
                children: [
                  buildUsernameEmail(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Flexible(
                        child: buildPassword(),
                        flex: 8,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: buildCVV(),
                        flex: 4,
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  buildPronouns(),
                  const SizedBox(height: 300),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                        primary: Colors.teal[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: RichText(
                          text: TextSpan(
                            text: 'Save',
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
            prefixIcon: Icon(Icons.credit_card),
            hintText: 'Card number',
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
      decoration: InputDecoration(
        hintText: 'Expiration Date: MM/DD/YY',
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
      keyboardType: TextInputType.visiblePassword);

  Widget buildCVV() => TextFormField(
        decoration: InputDecoration(
          hintText: 'CVV',
          border: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPronouns() => TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.place),
          hintText: 'Country',
          border: OutlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: Colors.white,
          filled: true,
        ),
        keyboardType: TextInputType.emailAddress,
      );
}