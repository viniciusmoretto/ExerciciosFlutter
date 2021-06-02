import 'components/TaskCard.dart';
import 'package:flutter/material.dart';
import 'components/Task.dart';

List<Task> _compras = [Task("Tomate", true, 12, false)];

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final title = 'Compras concluidas';

    TextEditingController descricaoController = TextEditingController();
    TextEditingController quantidadeTask = TextEditingController();

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            child: Column(
              children: [
                TextField(
                  controller: descricaoController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.assignment),
                      hintText: 'Informe o ingrediente'),
                ),
                TextField(
                  controller: quantidadeTask,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.format_list_numbered_rounded),
                      hintText: 'Informe a quantidade'),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _compras.add(Task(descricaoController.text, true,
                            int.parse(quantidadeTask.text), false));
                      });
                    },
                    child: Text("Adicionar")),
                SizedBox(
                  height: 70,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _compras.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: TaskCard(_compras[index]),
                        onLongPress: () {
                          print(_compras[index].descricao);
                        },
                      );
                    },
                  ),
                ),
                Checkbox(
                  value: this.value,
                  onChanged: (bool value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
                /*
                Expanded(
                  child: ListView.builder(
                    itemCount: _compras.length,
                    itemBuilder: (context, index) {
                      _compras.map((Task compra) => CheckboxListTile(
                          title: Text(compra.descricao),
                          value: compra.isChecked,
                          onChanged: (bool val) {
                            setState(() => compra.isChecked = val);
                          }));
                    },
                  ),
                )*/
              ],
            )),
      ),
    );
  }
}
