import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Spells extends StatefulWidget {
  @override
  _SpellsState createState() => _SpellsState();
}

class _SpellsState extends State<Spells> {

   AudioCache _audioCache = AudioCache(prefix: "audios/feiticos/");

  _executar(String nomeAudio) {
    _audioCache.play(nomeAudio + ".mp3");
  }

  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "summoner_flash.mp3",
      "summoner_ignite.mp3",
      "summoner_smite.mp3",
      "summoner_teleport.mp3",
      "summoner_heal.mp3",
      "summoner_exhaust.mp3"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _executar("summoner_flash");
          },
          child: Image.asset("assets/imagens/feiticos/Flash.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("summoner_ignite");
          },
          child: Image.asset("assets/imagens/feiticos/Ignite.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("summoner_smite");
          },
          child: Image.asset("assets/imagens/feiticos/Smite.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("summoner_teleport");
          },
          child: Image.asset("assets/imagens/feiticos/Teleport.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("summoner_heal");
          },
          child: Image.asset("assets/imagens/feiticos/Heal.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("summoner_exhaust");
          },
          child: Image.asset("assets/imagens/feiticos/Exhaust.png"),
        ),
      ],
    );
  }
}