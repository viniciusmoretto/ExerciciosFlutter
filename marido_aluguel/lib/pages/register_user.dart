import 'package:flutter/material.dart';
import 'package:marido_aluguel/components/user_list.dart';
import 'package:marido_aluguel/main.dart';
import 'package:marido_aluguel/models/schedule_jose.dart';
import 'package:marido_aluguel/models/user.dart';
import 'package:marido_aluguel/pages/jose_tasks.dart';

/*[User(
  "1",
  "vinicius",
  "vinicin@gmail.com",
  "https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png",
  "Bela-vista"
),];*/

class RegisterUser extends StatelessWidget {
  TextEditingController idUser = TextEditingController();
  TextEditingController nameUser = TextEditingController();
  TextEditingController emailUser = TextEditingController();
  TextEditingController photoUser = TextEditingController();
  TextEditingController districtUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CADASTRO DE USUARIO"),
        ),
        elevation: 4.0,
      ),
      body: Container(
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: idUser,
                textAlign: TextAlign.center,
                /*keyboardType: TextInputType.numberWithOptions(decimal: true),*/
                decoration: InputDecoration(
                  hintText: 'digite o id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Id do usuário',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 8,
            ),
            TextField(
                controller: nameUser,
                textAlign: TextAlign.center,
                /*keyboardType: TextInputType.numberWithOptions(decimal: true),*/
                decoration: InputDecoration(
                  hintText: 'digite o usuario',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Nome de usuário',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 8,
            ),
            TextField(
                controller: emailUser,
                textAlign: TextAlign.center,
                /*keyboardType: TextInputType.numberWithOptions(decimal: true),*/
                decoration: InputDecoration(
                  hintText: 'digite o email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Email',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 8,
            ),
            TextField(
                controller: photoUser,
                textAlign: TextAlign.center,
                /*keyboardType: TextInputType.numberWithOptions(decimal: true),*/
                decoration: InputDecoration(
                  hintText: 'cole o url da imagem',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Url da foto',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 8,
            ),
            TextField(
                controller: districtUser,
                textAlign: TextAlign.center,
                /*keyboardType: TextInputType.numberWithOptions(decimal: true),*/
                decoration: InputDecoration(
                  hintText: 'digite seu bairro',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Bairro',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            ButtonTheme(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  listausuario.add(new User(idUser.text, nameUser.text,
                      emailUser.text, photoUser.text, districtUser.text));

                  listaTask.add(new Schedule(
                      'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 0));
                  Navigator.pop(context);
                },
                child: Text('Cadastrar Usuario'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
