import 'package:flutter/material.dart';
import 'Task.dart';
import '../TaskTodoList.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final _Checkado kkk = _Checkado();

  bool value = true;
  TaskCard(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 5),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(this.task.descricao, textAlign: TextAlign.left),
              Text(this.task.qtd.toString(), textAlign: TextAlign.right),
              kkk.criarcheckbox(value),
            ],
          )),
    );
  }

  void setState(Null Function() param0) {}
}

class Checkado extends StatefulWidget {
  _Checkado createState() => _Checkado();
}

class _Checkado extends State<Checkado> {
  bool value = false;
  criarcheckbox(bool valor) {
    return Checkbox(
        value: valor,
        onChanged: (bool valor) {
          setState(() {
            this.value = valor;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
