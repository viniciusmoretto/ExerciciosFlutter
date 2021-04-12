import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final valorCotacao = TextEditingController();
  String cotacao = '0.0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CONVERSOR DE MOEDAS"),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(34, 120, 34, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://oportaln10.com.br/wp-content/uploads/2020/11/Tipos-de-cassino-online-caracteristicas-principais-Cassino-online-que-tipos-existem-e-como-funcionam-scaled.jpeg',
            ),
            SizedBox(
              height: 80,
            ),
            TextField(
                controller: valorCotacao,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'digite o valor',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'R\$ valor em reais',
                  labelStyle: new TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 30.0,
            ),
            ButtonTheme(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    final double cotacaoMoeda =
                        double.parse((valorCotacao.text));
                    cotacao = "$cotacaoMoeda";
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Valores(cotacao)),
                  );
                },
                child: Text('Converter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Valores extends StatelessWidget {
  final String resultado;

  Valores(this.resultado);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VALORES"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "VALOR EM DOLAR: ${double.parse(resultado) * 5.78}",
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "VALOR EM EURO: ${double.parse(resultado) * 6.81}",
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "VALOR EM RMB: ${double.parse(resultado) * 0.88}",
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
