import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  String jogo;
  Resultado(this.jogo);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    
    print(widget.jogo);
    var caminhoImagem;
    if (widget.jogo == "cara") {
      caminhoImagem = "assets/moeda_cara.png";
      widget.jogo = caminhoImagem;
    } else {
      caminhoImagem = "assets/moeda_coroa.png";
      widget.jogo = caminhoImagem;
    }

    return Scaffold(
      backgroundColor: Color(0xFF6abe8c),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(widget.jogo),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/botao_voltar.png",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
