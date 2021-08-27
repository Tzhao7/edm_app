import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:edm_app/icons/custom_icons_icons.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Widget build(BuildContext context) {
    bool value = false;
    bool _lights = false;
    var listTileTitles = [
      'Enable push notifications',
      'New Events',
      'Suggested Events',
      'Day-of Reminders',
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Row(
            children: [
              Icon(Icons.arrow_back_ios_new_outlined),
              Icon(Icons.person_outline_rounded),
            ],
          ),
          bottom: PreferredSize(
              child: Container(color: Colors.grey, height: 3.0),
              preferredSize: Size.fromHeight(3.0)),
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              text: 'Notifications',
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
        body: Column(children: [
          Expanded(
              child: ListView(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.5, color: Colors.grey))),
                  child: MergeSemantics(
                      child: ListTileTheme(
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          child: ListTile(
                            tileColor: Colors.grey[850],
                            title: Text(listTileTitles[0]),
                            trailing: CupertinoSwitch(
                                value: value,
                                onChanged: (bool value) {
                                  setState(() {
                                    _lights = value;
                                  });
                                }),
                          )))),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.5, color: Colors.grey))),
                  child: ListTileTheme(
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      child: ListTile(
                        minVerticalPadding: 16,
                        tileColor: Colors.grey[850],
                        title: Text(listTileTitles[1]),
                        subtitle: Padding(
                            child: Text(
                              'Receive a notification whenever\none of your favorite artists\n announces a new performance',
                              textAlign: TextAlign.left,
                            ),
                            padding: EdgeInsets.only(top: 10)),
                        trailing: Padding(
                            child: CupertinoSwitch(
                                value: value,
                                onChanged: (bool value) {
                                  setState(() {
                                    _lights = value;
                                  });
                                }),
                            padding: EdgeInsets.only(top: 40)),
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
                        subtitle: Text(
                            'Receive a notification whenever one of your frequently listened to artists announces a new performance'),
                        title: Text(listTileTitles[2]),
                        trailing: CupertinoSwitch(
                            value: value,
                            onChanged: (bool value) {
                              setState(() {
                                _lights = value;
                              });
                            }),
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
                        title: Text(listTileTitles[3]),
                        subtitle: Text(
                            'Receive an early reminder the day-of any event you are attending'),
                        trailing: CupertinoSwitch(
                            value: value,
                            onChanged: (bool value) {
                              setState(() {
                                _lights = value;
                              });
                            }),
                      ))),
            ],
          )),
          Padding(
              padding: EdgeInsets.only(top: 175),
              child: ButtonTheme(
                minWidth: 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(70, 8.0, 70, 8.0),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    print('Login Pressed.');
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1.5, color: Colors.grey))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.ticket_alt), label: 'Tickets'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded), label: 'Account')
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}