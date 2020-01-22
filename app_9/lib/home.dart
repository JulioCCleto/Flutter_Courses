import 'package:app_9/helper/AnotacaoHelper.dart';
import 'package:app_9/model/Anotacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'model/Anotacao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<String, dynamic> _recuperarNotaRemovida = Map();

  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  var _db = AnotacaoHelper();

  List<Anotacao> _anotacoes = List<Anotacao>();

  _exibirTelaCadastro({Anotacao anotacao}) {
    String textoSalvarAtualizar = "";

    if (anotacao == null) {
      //Salvar
      _tituloController.text = "";
      _descricaoController.text = "";
      textoSalvarAtualizar = "Adicionar";
    } else {
      //Atualizar
      _tituloController.text = anotacao.titulo;
      _descricaoController.text = anotacao.descricao;
      textoSalvarAtualizar = "Editar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "$textoSalvarAtualizar Nota",
              style: TextStyle(color: Colors.grey[800], fontSize: 20),
            ),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
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
                    color: Color(0xFF961b1b),
                    fontSize: 20,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);
                  Navigator.pop(context);
                },
                child: Text(
                  textoSalvarAtualizar,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          );
        });
  }

  _recuperAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();

    List<Anotacao> listaTemporaria = List<Anotacao>();

    for (var item in anotacoesRecuperadas) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemporaria.add(anotacao);
    }

    setState(() {
      _anotacoes = listaTemporaria;
    });
    listaTemporaria = null;
  }

  _salvarAtualizarAnotacao({Anotacao anotacaoSelecionada}) async {
    //receber os dados dos forms, para salvar no banco de dados.
    //Criei um model com o construtor, passei como parametro na pagina AnotacaoHelper
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    //configurar a data

    if (anotacaoSelecionada == null) {
      //salvar

      Anotacao anotacao =
          Anotacao(titulo, descricao, DateTime.now().toString());
      int resultado = await _db.salvarAnotacao(anotacao);
    } else {
      // atualizar
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = DateTime.now().toString();

      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }

    _tituloController.clear();
    _descricaoController.clear();
    _recuperAnotacoes();
  }

  _formartarData(String data) {
    initializeDateFormatting("pt_BR");

    var formater = DateFormat("dd/MM/yyyy HH:mm");

    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formater.format(dataConvertida);

    return dataFormatada;
  }

  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);
    _recuperAnotacoes();
  }

  @override
  void initState() {
    super.initState();
    _recuperAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
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
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _anotacoes.length,
            itemBuilder: (context, index) {
              final anotacao = _anotacoes[index];
              return GestureDetector(
                onLongPress: () {
                  _exibirTelaCadastro(anotacao: anotacao);
                },
                child: Card(
                  child: Dismissible(
                    background: Container(
                      color: Color(0xFF961b1b),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {

                      _recuperarNotaRemovida = _anotacoes[index].toMap();

                      _removerAnotacao(anotacao.id);
                      setState(() {
                        _anotacoes.removeAt(index);
                      });

                      final snackBar = SnackBar(
                        content: Text(
                          'Nota removida! Deseja desfazer a ação?',                       
                        ),
                        action: SnackBarAction(
                          label: "Desfazer",
                          onPressed: () {
                            setState(() {
                              print(_recuperarNotaRemovida);
                            });
                          }
                  
                        ),
                      );

                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                    child: ListTile(
                      title: Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              anotacao.titulo,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${_formartarData(anotacao.data)}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        "${anotacao.descricao}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
