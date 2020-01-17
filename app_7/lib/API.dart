import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "COLOCAR A CHAVE API AQUI";
const ID_CANAL = "UC5Op4wToavPhf_cSQn3uDvQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";


//Criando a classe da API, Lembrar de instancia-la depois
//não esquecer do & no começo da frase a partir do segundo Item, trava tudo.

class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=10"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&channelId=$ID_CANAL"
      "q=$pesquisa"
    );

    if(response.statusCode == 200){

        Map<String, dynamic> dadosJson = json.decode(response.body);
        print("Resultado: $dadosJson"); 
    }
    else{
        print("Não Funcionou");
    }
  }
}