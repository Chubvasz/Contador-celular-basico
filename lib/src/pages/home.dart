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
  void _decrementCounterP() {
    setState(() {
      if (_counterP>0) {
        _counterP--;
      }
    });
  }
  void _decrementCounterNP() {
    setState(() {
      if (_counterNP>0) {
        _counterNP--;
      }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.white,
                  onPressed: () {_incrementCounterP();}, 
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            'Eritrocitos\nparasitados',
                            style: TextStyle( fontSize: 20, color: Colors.purple ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.all(25),
                            child: Text(
                              '$_counterP',
                              style: TextStyle( fontSize: 40, color: Colors.purple ),
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                ),
                FlatButton(
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.white,
                  onPressed: () {_incrementCounterNP();}, 
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            'Eritrocitos\nno parasitados',
                            style: TextStyle( fontSize: 20, color: Colors.red ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.all(25),
                            child: Text(
                              '$_counterNP',
                              style: TextStyle( fontSize: 40, color: Colors.red ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
          child: Icon(Icons.remove),
          backgroundColor: Colors.purple,
          onPressed: _decrementCounterP,
        ),
        SizedBox(width: 25.0,),
        FloatingActionButton(
          child: Icon(Icons.remove),
          backgroundColor: Colors.red,
          onPressed: _decrementCounterNP,
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
