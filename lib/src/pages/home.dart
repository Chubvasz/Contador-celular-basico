import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterP = 0;
  int _counterNP = 0;

  void _incrementCounterP() {
    setState(() {
      _counterP++;
    });
  }
  void _incrementCounterNP() {
    setState(() {
      _counterNP++;
    });
  }
  void _reset() {
    setState(() {
      _counterP=0;
      _counterNP=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Eritrocitos parasitados',
              style: TextStyle( fontSize: 20, color: Colors.purple ),
            ),
            Text(
              '$_counterP',
              style: TextStyle( fontSize: 40, color: Colors.purple ),
            ),
            Text(
              'Eritrocitos no parasitados',
              style: TextStyle( fontSize: 20, color: Colors.red ),
            ),
            Text(
              '$_counterNP',
              style: TextStyle( fontSize: 40, color: Colors.red ),
            ),
          ],
        ),
      ),
      floatingActionButton: _cargarBotones(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _cargarBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0,),
        FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: _incrementCounterP,
        ),
        SizedBox(width: 25.0,),
        FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: _incrementCounterNP,
        ),
        Expanded(child: SizedBox(),),
        FloatingActionButton(
          child: Text((_counterP+_counterNP).toString(), style: TextStyle( fontSize: 20.0,)),
          backgroundColor: Colors.blueGrey,
          onPressed: null,//_incrementParasid,
        ),
        SizedBox(width: 10.0,),
        FloatingActionButton(
          child: Icon(Icons.rotate_left),
          backgroundColor: Colors.grey,
          onPressed: _reset,
        ),
      ],
    );
  }
}
