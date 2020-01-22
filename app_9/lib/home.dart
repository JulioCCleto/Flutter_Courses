import 'package:app_9/helper/AnotacaoHelper.dart';
import 'package:app_9/model/Anotacao.dart';
import 'package:flutter/material.dart';

import 'model/Anotacao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  var _db = AnotacaoHelper();

  List<Anotacao> anotacoes = List<Anotacao>();


  _exibirTelaCadastro() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Adicionar anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF961b1b), style: BorderStyle.solid),
                      ),
                      labelText: "Título",
                      labelStyle:
                          TextStyle(fontSize: 20, color: Colors.grey[700]),
                      hintText: "Digite o título..."),
                ),
                TextField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF961b1b), style: BorderStyle.solid),
                      ),
                      labelText: "Descrição",
                      labelStyle:
                          TextStyle(fontSize: 20, color: Colors.grey[700]),
                      hintText: "Digite a descrição..."),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  _salvarAnotacao();
                  Navigator.pop(context);
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          );
        });
  }

  _recuperAnotacoes() async{

    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
    print("Lista anotacoes: " + anotacoesRecuperadas.toString());

  }

  _salvarAnotacao() async {
    //receber os dados dos forms, para salvar no banco de dados.
    //Criei um model com o construtor, passei como parametro na pagina AnotacaoHelper
    String titulo = _tituloController.text;
    String descricao = _tituloController.text;

    //configurar a data

    Anotacao anotacao = Anotacao(titulo, descricao, DateTime.now().toString());
    int resultado = await _db.salvarAnotacao(anotacao);

    print("Salvar anotação: " + resultado.toString());
  }

  @override
  Widget build(BuildContext context) {

    _recuperAnotacoes();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anotações",
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Color(0xFF961b1b),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF961b1b),
        onPressed: () {
          _exibirTelaCadastro();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _body() {
    return Column(
      children: <Widget>[],
    );
  }
}
