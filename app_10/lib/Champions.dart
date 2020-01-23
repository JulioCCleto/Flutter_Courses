import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Champions extends StatefulWidget {
  @override
  _ChampionsState createState() => _ChampionsState();
}

class _ChampionsState extends State<Champions> {
  AudioCache _audioCache = AudioCache(prefix: "audios/champions/");

  _executar(String nomeAudio) {
    _audioCache.play(nomeAudio + ".mp3");
  }

  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "LeeSin.mp3",
      "Soraka.mp3",
      "Riven.mp3",
      "Lux.mp3",
      "Nami.mp3",
      "Thresh.mp3"
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
            _executar("LeeSin");
          },
          child: Image.asset("assets/imagens/champions/Lee.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("Soraka");
          },
          child: Image.asset("assets/imagens/champions/Soraka.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("Riven");
          },
          child: Image.asset("assets/imagens/champions/Riven.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("Lux");
          },
          child: Image.asset("assets/imagens/champions/Lux.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("Nami");
          },
          child: Image.asset("assets/imagens/champions/Nami.png"),
        ),
        GestureDetector(
          onTap: () {
            _executar("Thresh");
          },
          child: Image.asset("assets/imagens/champions/Thresh.png"),
        ),
      ],
    );
  }
}
