import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var platformChannel = MethodChannel("cellcounter.eduardo.com/buttonaction");

  int _counterP = 0;
  int _counterNP = 0;
  double _counterParasitemia = 0.0;

  void _channel() async {
    String response;
    try {
      response = await platformChannel.invokeMethod("buttonAction", "tap");
      print("Comunicacion correcta");
    } on Exception {
      print("Comunicacion incorrecta");
      response = "false";
    }
  }

  void _incrementCounterP() {
    setState(() {
      _counterP++;
      _countParasitemia();
      _channel();
    });
  }
  void _incrementCounterNP() {
    setState(() {
      _counterNP++;
      _countParasitemia();
      _channel();
    });
  }
  void _decrementCounterP() {
    setState(() {
      if (_counterP>0) {
        _counterP--;
        _countParasitemia();
      }
    });
  }
  void _decrementCounterNP() {
    setState(() {
      if (_counterNP>0) {
        _counterNP--;
        _countParasitemia();
      }
    });
  }
  void _reset() {
    setState(() {
      _counterP           = 0;
      _counterNP          = 0;
      _counterParasitemia = 0;
    });
  }
  void _countParasitemia() {
    _counterParasitemia = num.parse(((_counterP*100)/(_counterP+_counterNP)).toStringAsFixed(1));
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
                _crearCardEP(),
                Padding(padding: EdgeInsets.only(left: 20)),
                _crearCardENP(),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 60)),
            _crearContadorParasitemiaCard(),
          ],
        ),
      ),
      floatingActionButton: _cargarBotones(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _crearCardEP() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () {_incrementCounterP();},
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
        ),
      )
    );
  }

  Widget _crearCardENP() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () {_incrementCounterNP();},
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
    );
  }

  Widget _crearContadorParasitemiaCard() {
    return Card(
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'Parasitemia', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(top: 8,)),
            Text(
              '$_counterParasitemia %',
              style: TextStyle(fontSize: 20, ),
            )
          ],
        ),
      ),
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
