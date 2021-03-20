import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String planet = '';
  String planetImage = '';
  List planetInfo = [
    {
      'planet': 'earth',
      'img':
          'https://physicsworld.com/wp-content/uploads/2020/07/Flat_Earth_illustration.jpg'
    },
    {
      'planet': 'pluto',
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSllNiLlpwQJB62fKvAQfb6k6nWc1M_7ZzZkA&usqp=CAU'
    },
    {
      'planet': 'mars',
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBBLVGOiHP1wBZ8KURHUH0Z7x1hYJYxQTKsA&usqp=CAU'
    }
  ];

  void changePlanet(String planetName) {
    setState(() {
      planet = planetName;
      planetImage =
          planetInfo.where((i) => i['planet'] == planetName).toList()[0]['img'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('planets gallery'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 50),
              Text(
                planet != '' ? 'planet $planet' : 'please select planet !',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 50),
              Container(
                width: 250.0,
                height: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage("$planetImage")),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 5.0,
            runSpacing: 10.0,
            children: [
              TextButton(
                onPressed: () => changePlanet('mars'),
                child: Text(
                  "show mars".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[600]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue[800])))),
              ),
              TextButton(
                onPressed: () => changePlanet('pluto'),
                child: Text(
                  "show pluto".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[600]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue[800])))),
              ),
              TextButton(
                onPressed: () => changePlanet('earth'),
                child: Text(
                  "show earth".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[600]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue[800])))),
              ),
            ],
          )
        ],
      )),
    );
  }
}
