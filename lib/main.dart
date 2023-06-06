import 'package:flutter/material.dart';
import 'package:project_expenses/models/transaction.dart';
import './models/transaction.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _transactions = [
      Transaction(
          id: 't1',
          title: 'Novo Tenis de corrida',
          value: 310.76,
          date: DateTime.now()),
      Transaction(
          id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Card(
              child: Text('Lista de Transações'),
            ),
          ],
        ));
  }
}
