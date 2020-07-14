import 'package:flutter/material.dart';
import 'package:slowly_moving_widgets_field/slowly_moving_widgets_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Slowly Moving Widgets';

  final List<Moving> _list = [];

  @override
  void initState() {
    super.initState();

    int _rotate = 0;
    Color _color;
    for (int _index = 0; _index < 16; _index++) {
      switch (_rotate) {
        case 0:
          _color = Color(0xFFC41A3B);
          break;
        case 1:
          _color = Color(0xFF1B1F32);
          break;
        case 2:
          _color = Colors.purple;
          break;
        case 3:
          _color = Color(0xFFFBE0E6);
          break;
      }

      _rotate++;
      _rotate %= 4;

      _list.add(
        Moving(
          height: 50.0,
          width: 50.0,
          child: Container(
            height: 75.0,
            width: 75.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: _color
            ),
            child: Text(
              "$_index",
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: SlowlyMovingWidgetsField(
          list: _list,
        ),
      ),
    );
  }
}
