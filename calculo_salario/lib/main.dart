import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final valorHorasTrabalhadas = TextEditingController();
  final valorSalarioHora = TextEditingController();
  final valorDependentes = TextEditingController();
  String horasTrabalhadas = "0.0";
  String salarioHora = "0.0";
  String dependentes = "0.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CALCULO SALARIO')),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "INSIRA OS DADOS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
            ),
            SizedBox(
              height: 70,
            ),
            TextField(
                controller: valorHorasTrabalhadas,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'digite o numero de horas',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Horas trabalhadas',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: valorSalarioHora,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'digite o valor por hora',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Salario hora',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: valorDependentes,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'digite a quantidade',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Total dependentes',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 40,
            ),
            ButtonTheme(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    final double valorHorasTrabalhadasFinal =
                        double.parse((valorHorasTrabalhadas.text));
                    horasTrabalhadas = "$valorHorasTrabalhadasFinal";

                    final double valorSalarioHoraFinal =
                        double.parse((valorSalarioHora.text));
                    salarioHora = "$valorSalarioHoraFinal";

                    final double valorDependentesFinal =
                        double.parse((valorDependentes.text));
                    dependentes = "$valorDependentesFinal";
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Valores(
                            horasTrabalhadas, salarioHora, dependentes)),
                  );
                },
                child: Text('Calcular'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Valores extends StatelessWidget {
  final String horaTrabalhadasRecebe;
  final String salarioHoraRecebe;
  final String dependentesRecebe;
  double salarioBruto;
  double descontoInss;
  double descontoIr;
  double salarioLiquido;

  Valores(this.horaTrabalhadasRecebe, this.salarioHoraRecebe,
      this.dependentesRecebe);

  double calculoSalarioBruto(
      double horaTrabalhadas, double salarioHora, double dependentes) {
    this.salarioBruto = horaTrabalhadas * salarioHora + (50 * dependentes);
    return this.salarioBruto;
  }

  double calculoDescontoInss(
      double horaTrabalhadas, double salarioHora, double dependentes) {
    double descontoInss;
    if (calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) <=
        1000) {
      descontoInss = (salarioBruto * 8.5) / 100;
    } else if (calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) >
        1000) {
      descontoInss = (salarioBruto * 9) / 100;
    }
    return descontoInss;
  }

  double calculoDescontoIr(
      double horaTrabalhadas, double salarioHora, double dependentes) {
    double descontoIr;
    if (calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) <= 500) {
      descontoIr = 0;
    } else if (calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) >
            500 &&
        calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) <=
            1000) {
      descontoIr =
          ((calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) *
                  5) /
              100);
    } else if (calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) >
        1000) {
      descontoIr =
          (calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) * 7) /
              100;
    }
    return descontoIr;
  }

  double calculoSalarioLiquido(
      double horaTrabalhadas, double salarioHora, double dependentes) {
    double salarioLiquido =
        calculoSalarioBruto(horaTrabalhadas, salarioHora, dependentes) -
            calculoDescontoInss(horaTrabalhadas, salarioHora, dependentes) -
            calculoDescontoIr(horaTrabalhadas, salarioHora, dependentes);
    return salarioLiquido;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('RESULTADO')),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Seu salario bruto é: ${calculoSalarioBruto(double.parse(horaTrabalhadasRecebe), double.parse(salarioHoraRecebe), double.parse(dependentesRecebe))}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Seu desconto inss é: ${calculoDescontoInss(double.parse(horaTrabalhadasRecebe), double.parse(salarioHoraRecebe), double.parse(dependentesRecebe))}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Seu desconto ir é: ${calculoDescontoIr(double.parse(horaTrabalhadasRecebe), double.parse(salarioHoraRecebe), double.parse(dependentesRecebe))}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Seu salario liquido é: ${calculoSalarioLiquido(double.parse(horaTrabalhadasRecebe), double.parse(salarioHoraRecebe), double.parse(dependentesRecebe))}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 30.0,
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
