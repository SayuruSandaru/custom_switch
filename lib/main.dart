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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IconData darkThemeIcon = Icons.nights_stay;
  IconData lightThemeIcon = Icons.wb_sunny_rounded;
  IconData knobIcon = Icons.nights_stay;
  bool switchStatus = false;
  Alignment knobAligment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom switch'),
        backgroundColor: Color(0xFF3B7D73),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              switchStatus ? switchStatus = false : switchStatus = true;
              knobIcon == Icons.nights_stay
                  ? knobIcon = lightThemeIcon
                  : knobIcon = darkThemeIcon;
              knobAligment == Alignment.centerRight
                  ? knobAligment = Alignment.centerLeft
                  : knobAligment = Alignment.centerRight;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 70,
            height: 40,
            curve: Curves.decelerate,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400], width: 1),
              borderRadius: BorderRadius.circular(100),
              color: Color(0xFF9DBEB9),
            ),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    darkThemeIcon,
                    size: 20,
                    color: Color(0xFF3B7D73),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    lightThemeIcon,
                    size: 20,
                    color: Color(0xFF3B7D73),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: knobAligment,
                curve: Curves.decelerate,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 30,
                    width: 30,
                    child: Icon(
                      knobIcon,
                      size: 20,
                      color: Color(0xFF973300),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFCB997E),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
