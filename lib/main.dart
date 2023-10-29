//Paola Andrea Guzmán Aristizábal

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Notas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de Notas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _notafinal = 0;
  String _mensaje="";
  final _nota1 = TextEditingController();
  final _nota2 = TextEditingController();
  final _nota3 = TextEditingController();
  final _nota4 = TextEditingController();

  void _calcularnota() {
    setState(() {
      _notafinal = (double.parse(_nota1.text) +
          double.parse(_nota2.text) +
          double.parse(_nota3.text) +
          double.parse(_nota4.text)) /
          4;
      if(_notafinal<6.0){
        _mensaje="Perdiste la materia";
      } else {
        _mensaje="Ganaste la materia";
      }
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize:35,
                    fontWeight: FontWeight.bold),
                'La Nota Final es ${_notafinal.toStringAsFixed(2)}',
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-24,
                    child: TextFormField(
                      controller: _nota1,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                            width: 4.0,
                          ),
                        ),
                        labelText: "Ingrese la nota 1",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-24,
                    child: TextFormField(
                      controller: _nota2,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                            width: 4.0,
                          ),
                        ),
                        labelText: "Ingrese la nota 2",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-24,
                    child: TextFormField(
                      controller: _nota3,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                            width: 4.0,
                          ),
                        ),
                        labelText: "Ingrese la nota 3",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-24,
                    child: TextFormField(
                      controller: _nota4,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                            width: 4.0,
                          ),
                        ),
                        labelText: "Ingrese la nota 4",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.onetwothree, size: 35),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                label: const Text("Calcular"),
                onPressed: () {
                  _calcularnota();
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                textAlign: TextAlign.center,
                '$_notafinal de 10.00 \n $_mensaje',
                style: const TextStyle(
                    fontSize:20,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
