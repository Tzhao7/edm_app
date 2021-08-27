import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var menuText = [
      'My Cart',
      'Purchase History',
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: PreferredSize(
              child: Container(color: Colors.grey, height: 3.0),
              preferredSize: Size.fromHeight(3.0)),
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              text: 'Tickets',
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
        body: ListView(
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.5, color: Colors.grey))),
                child: ListTileTheme(
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    child: ListTile(
                      tileColor: Colors.grey[850],
                      leading: Icon(Icons.shopping_cart_outlined),
                      title: Text(menuText[0]),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ))),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.5, color: Colors.grey))),
                child: ListTileTheme(
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    child: ListTile(
                      tileColor: Colors.grey[850],
                      leading: Icon(Icons.history_outlined),
                      title: Text(menuText[1]),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ))),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket), label: 'Tickets'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded), label: 'Account')
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
