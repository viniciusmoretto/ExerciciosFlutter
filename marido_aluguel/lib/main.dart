import 'package:flutter/material.dart';
import 'package:marido_aluguel/models/schedule_jose.dart';
import 'package:marido_aluguel/pages/jose_tasks.dart';
import 'package:marido_aluguel/pages/register_user.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

List<Schedule> listaTask = [];

List<User> listausuario = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        'home': (BuildContext context) => MyHomePage(),
        'tasks': (BuildContext context) => JoseTask(),
        'createUser': (BuildContext context) => RegisterUser(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Principal'),
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
  TextEditingController nameUser = TextEditingController();
  TextEditingController emailUser = TextEditingController();
  TextEditingController photoUser = TextEditingController();
  TextEditingController districtUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("MARIDO DE ALUGUEL"),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            (listausuario.length != 0)
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        itemCount: listausuario.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            child: Card(
                              child: Text(listausuario[i].user),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JoseTask()));
                            },
                          );
                        }))
                : Center(
                    child: Text(
                        'Não há usuarios cadastrados.\n\nFaça um cadastro e clique novamente em "Cadastrar"\n\nAssim que for cadastrado clique sobre o usuário'),
                  ),
            Spacer(),
            new FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, 'createUser');
                });
              },
              label: Text('Cadastrar'),
              icon: Icon(Icons.person_add),
              backgroundColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
/*Expanded(
              child: Container(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, 'createUser');
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),*/

/*ButtonTheme(
              height: 50,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, 'createUser');
              }),
            ),
            */

/*
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
          */
