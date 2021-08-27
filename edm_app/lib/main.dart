import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:async';
import 'package:edm_app/utils/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:edm_app/icons/custom_icons_icons.dart';

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Initially display FirstPage
      initialRoute: '/welcome',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}*/

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final HttpLink link = HttpLink('http://10.0.2.2:5000');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(cache: GraphQLCache(store: InMemoryStore()), link: link),
  );

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const MyApp({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: client,
        child: CacheProvider(
            child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.teal,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        )));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: PreferredSize(
              child: Container(color: Colors.grey, height: 3.0),
              preferredSize: Size.fromHeight(3.0)),
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              text: 'Home',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Times New Roman',
                  color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border(
                          right: BorderSide(width: 3.0, color: Colors.grey),
                          bottom: BorderSide(width: 3.0, color: Colors.grey),
                        )),
                    child: TextButton.icon(
                      icon: Icon(CustomIcons.newspaper,
                          size: 20, color: Colors.white),
                      label: RichText(
                          text: TextSpan(
                        text: 'News',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Times New Roman',
                            color: Colors.white),
                      )),
                      onPressed: null,
                    ),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(
                      right: BorderSide(width: 3.0, color: Colors.grey),
                      bottom: BorderSide(width: 3.0, color: Colors.grey),
                    )),
                child: TextButton.icon(
                  icon: Icon(Icons.calendar_view_month,
                      size: 20, color: Colors.white),
                  label: RichText(
                      text: TextSpan(
                    text: 'Suggested Events',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Times New Roman',
                        color: Colors.white),
                  )),
                  onPressed: null,
                ),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border(
                          bottom: BorderSide(width: 3.0, color: Colors.grey),
                        )),
                    child: TextButton.icon(
                      icon: Icon(CustomIcons.heart,
                          size: 20, color: Colors.white),
                      label: RichText(
                          text: TextSpan(
                        text: 'Artists',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Times New Roman',
                            color: Colors.white),
                      )),
                      onPressed: null,
                    ),
                  )),
            ]),
            Text.rich(
                TextSpan(text: 'Click the "+" to add to your ', children: [
                  TextSpan(
                      text: 'Favorite Artists',
                      style: TextStyle(decoration: TextDecoration.underline))
                ]),
                style: TextStyle(color: Colors.white)),
            Padding(
                padding: EdgeInsets.fromLTRB(64.0, 8.0, 64.0, 8.0),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.white,
                )),
            RelatedArtists()
          ],
        ));
  }
}

class RelatedArtists extends StatefulWidget {
  @override
  RelatedArtistsState createState() {
    return RelatedArtistsState();
  }
}

class RelatedArtistsState extends State<RelatedArtists> {
  static const platformMethodChannel = const MethodChannel('com.spotify');
  String code = '';
  var imageIDs = new Map();

  Future<Null> _spotifyAuthentication() async {
    platformMethodChannel.setMethodCallHandler(this.receiveFromAndroid);
    try {
      await platformMethodChannel.invokeMethod('authenticateUser');
    } on PlatformException {
      print("Authentication Error.");
    }
  }

  Future<void> receiveFromAndroid(MethodCall methodCall) async {
    switch (methodCall.method) {
      case "ReceiveFromAndroid":
        code = methodCall.arguments;
        print(code);
    }
  }

  String postCode = """
    mutation PostCode(\$code : String!) {
      postCode(code: \$code) {
        album_type
        name
      }
    }
    """;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Mutation(
            options: MutationOptions(
                document: gql(postCode),
                onCompleted: (result) {
                  print("Called");
                }),
            builder: (runMutation, result) {
              return Column(children: [
                TextButton(
                    child: const Text('Authenticate',
                        style: TextStyle(color: Colors.white)),
                    onPressed: _spotifyAuthentication),
                TextButton(
                  child: const Text('Create',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () => runMutation({'code': code}),
                ),
                Text('${result!.data.toString()}',
                    style: TextStyle(color: Colors.white)),
                Flexible(
                    child: GridView.count(
                  scrollDirection: Axis.vertical,
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'images/brandon-erlinger-ford-wZnH3isZNkw-unsplash.jpg')),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'images/brandon-erlinger-ford-wZnH3isZNkw-unsplash.jpg')),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'images/brandon-erlinger-ford-wZnH3isZNkw-unsplash.jpg')),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'images/brandon-erlinger-ford-wZnH3isZNkw-unsplash.jpg')),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'images/brandon-erlinger-ford-wZnH3isZNkw-unsplash.jpg')),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'images/brandon-erlinger-ford-wZnH3isZNkw-unsplash.jpg')),
                      ),
                    ),
                  ],
                ))
              ]);
            }));
  }
}

/*class NativeStuff extends StatefulWidget {
  @override
  NativeStuffState createState() {
    return NativeStuffState();
  }
}

class NativeStuffState extends State<NativeStuff> {
  static const platformMethodChannel = const MethodChannel('com.spotify');
  String _message = '';
  String code = '';
  var imageIDs = new Map();

  Future<Null> _spotifyAuthentication() async {
    String message;
    print('hi');
    platformMethodChannel.setMethodCallHandler(this.receiveFromAndroid);
    try {
      final String result =
          await platformMethodChannel.invokeMethod('authenticateUser');
      message = result;
    } on PlatformException catch (e) {
      message = "Can't do authenticate ${e.message}.";
    }

    setState(() {
      _message = message;
    });
  }

  Future<void> receiveFromAndroid(MethodCall methodCall) async {
    switch (methodCall.method) {
      case "ReceiveFromAndroid":
        code = methodCall.arguments;
        print(code);
    }
  }

  String postCode = """
  mutation PostCode(\$code : String!) {
    postCode(code: \$code) 
  }
  """;

  void printCode(code) {
    print(code);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 102.0),
            child: Center(
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.power_settings_new,
                  size: 100,
                ),
                label: Text(''),
                onPressed: _spotifyAuthentication,
              ),
            ),
          ),
          Mutation(
              options: MutationOptions(
                  document: gql(postCode),
                  onCompleted: (result) {
                    print("Called");
                  }),
              builder: (runMutation, result) {
                return Column(children: [
                  TextButton(
                      child: const Text('Create Post'),
                      onPressed: () => runMutation({'code': code})),
                  Text('Result : \n ${result!.data.toString()}')
                ]);
              })
        ],
      ),
    );
  }
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
