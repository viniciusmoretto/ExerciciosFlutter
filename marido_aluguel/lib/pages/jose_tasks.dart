import 'package:flutter/material.dart';
import 'package:marido_aluguel/components/user_list.dart';
import 'package:marido_aluguel/main.dart';
import 'package:marido_aluguel/pages/register_user.dart';
import 'package:marido_aluguel/models/user.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        'home': (BuildContext context) => JoseTask(),
        'createUser': (BuildContext context) => RegisterUser(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: JoseTask(title: 'Principal'),
    );
  }
}

class JoseTask extends StatefulWidget {
  JoseTask({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JoseTask createState() => _JoseTask();
}

class _JoseTask extends State<JoseTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Jose Tasks'),
        ),
      ),
      body: ListView.builder(
        itemCount: listaTask.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Segunda: ' + listaTask[i].monday),
                  Text('Terça: ' + listaTask[i].thuesday),
                  Text('Quarta: ' + listaTask[i].wednesday),
                  Text('Quinta: ' + listaTask[i].thursday),
                  Text('Sexta: ' + listaTask[i].friday),
                  Text('Sábado: ' + listaTask[i].saturday),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
