import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida = Map();
  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;

    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });

    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();
    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Widget criarItemLista(context, index) {
    //final item = _listaTarefas[index]["titulo"];

    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        //Recuperar o último item excluido
         _ultimaTarefaRemovida = _listaTarefas[index];

        //Remove item da lista
        _listaTarefas.removeAt(index);
        _salvarArquivo();

        //Snackbar
        final snackbar = SnackBar(
          content: Text("Tarefa removida!"),
          duration: Duration(seconds: 7),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              //Insere novamente o item removido na lista
              setState(() {
                _listaTarefas.insert(index, _ultimaTarefaRemovida);
              });

              _salvarArquivo();
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      background: Container(
        color: Color(0xFF5E2129),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
        activeColor: Color(0xFF5E2129),
        title: Text(
          _listaTarefas[index]['titulo'],
          style: TextStyle(fontSize: 20),
        ),
        value: _listaTarefas[index]['realizada'],
        onChanged: (valorAlterado) {
          setState(() {
            _listaTarefas[index]['realizada'] = valorAlterado;
          });
          _salvarArquivo();
        },
      ),
    );
  }
    
  @override
  void initState() {
    super.initState();

    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Tarefas",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Color(0xFF5E2129),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5E2129),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: InputDecoration(labelText: "Digite sua tarefa"),
                    onChanged: (text) {},
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Cancelar"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                        child: Text("Salvar"),
                        onPressed: () {
                          _salvarTarefa();
                          Navigator.pop(context);
                        }),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: _listaTarefas.length, itemBuilder: criarItemLista),
        ),
      ],
    );
  }
}
