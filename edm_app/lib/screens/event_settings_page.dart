import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EventSettingsPage extends StatefulWidget {
  @override
  _EventSettingsPageState createState() => _EventSettingsPageState();
}

class _EventSettingsPageState extends State<EventSettingsPage> {
  bool value = false;
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    var menuText = [
      'Title',
      'Location',
      'All-day',
      'Starts',
      'Ends',
      'Repeat',
      'Travel Time',
      'Calendar',
      'Invitees',
      'Alert',
      'Show As',
      'Add attachment...'
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: AppBar(
                bottom: PreferredSize(
                    child: Container(color: Colors.grey, height: 3.0),
                    preferredSize: Size.fromHeight(3.0)),
                leading: Row(children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.red,
                    size: 15,
                  ),
                  RichText(
                      text: TextSpan(
                          text: '2021',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Times New Roman',
                              color: Colors.red)))
                ]),
                backgroundColor: Colors.black)),
        body: Column(children: [
          ListTileTheme(
              dense: true,
              textColor: Colors.white,
              iconColor: Colors.white,
              child: ListTile(
                tileColor: Colors.grey[850],
                leading: TextButton(
                  child: Text('Cancel'),
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: 15, fontFamily: 'Times New Roman')),
                  onPressed: null,
                ),
                title: Center(child: Text('New Event')),
                trailing: TextButton(
                  child: Text('Add'),
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: 15, fontFamily: 'Times New Roman')),
                  onPressed: null,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 95,
              child: ListView(
                  children: ListTile.divideTiles(
                      color: Colors.white,
                      context: context,
                      tiles: [
                    ListTileTheme(
                        dense: true,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        child: ListTile(
                          tileColor: Colors.grey[850],
                          leading: Text(menuText[0]),
                          title: Text('Galantis'),
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                        )),
                    ListTileTheme(
                        dense: true,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        child: ListTile(
                          tileColor: Colors.grey[850],
                          leading: Text(menuText[1]),
                          title: Text(
                            'Marquee - New York, NY',
                          ),
                          trailing: CupertinoSwitch(
                              value: value,
                              onChanged: (bool value) {
                                setState(() {
                                  _lights = value;
                                });
                              }),
                        ))
                  ]).toList())),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 240,
            child: ListView(
                children: ListTile.divideTiles(
                    context: context,
                    color: Colors.white,
                    tiles: [
                  ListTileTheme(
                      dense: true,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      child: ListTile(
                        tileColor: Colors.grey[850],
                        leading: Text(menuText[2]),
                      )),
                  ListTileTheme(
                      dense: true,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      child: ListTile(
                          tileColor: Colors.grey[850],
                          leading: Text(menuText[3]),
                          title: Text('October 30, 2021'),
                          trailing: Text('10:30 PM'))),
                  ListTileTheme(
                      dense: true,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      child: ListTile(
                          tileColor: Colors.grey[850],
                          leading: Text(menuText[4]),
                          trailing: Text('12:30 AM'))),
                  ListTileTheme(
                      dense: true,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      child: ListTile(
                          tileColor: Colors.grey[850],
                          leading: Text(menuText[5]),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Never'),
                                Icon(Icons.arrow_forward_ios_outlined)
                              ]))),
                  ListTileTheme(
                      dense: true,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      child: ListTile(
                          tileColor: Colors.grey[850],
                          leading: Text(menuText[6]),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('None'),
                                Icon(Icons.arrow_forward_ios_outlined)
                              ])))
                ]).toList()),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 95,
              child: ListView(
                  children: ListTile.divideTiles(
                      context: context,
                      color: Colors.white,
                      tiles: [
                    ListTileTheme(
                        dense: true,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        child: ListTile(
                            tileColor: Colors.grey[850],
                            leading: Text(menuText[7]),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Personal'),
                                  Icon(Icons.arrow_forward_ios_outlined)
                                ]))),
                    ListTileTheme(
                        dense: true,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        child: ListTile(
                            tileColor: Colors.grey[850],
                            leading: Text(menuText[8]),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('None'),
                                  Icon(Icons.arrow_forward_ios_outlined)
                                ])))
                  ]).toList())),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 95,
              child: ListView(
                  children: ListTile.divideTiles(
                      context: context,
                      color: Colors.white,
                      tiles: [
                    ListTileTheme(
                        dense: true,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        child: ListTile(
                            tileColor: Colors.grey[850],
                            leading: Text(menuText[9]),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('None'),
                                  Icon(Icons.arrow_forward_ios_outlined)
                                ]))),
                    ListTileTheme(
                        dense: true,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        child: ListTile(
                            tileColor: Colors.grey[850],
                            leading: Text(menuText[10]),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Busy'),
                                  Icon(Icons.arrow_forward_ios_outlined)
                                ])))
                  ]).toList())),
          SizedBox(
            height: 0,
          ),
          SizedBox(
              height: 16,
              child: ListTileTheme(
                  dense: true,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  child: ListTile(
                    tileColor: Colors.grey[850],
                    leading: Text(menuText[11]),
                  )))
        ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
