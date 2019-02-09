import 'dart:convert';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

Future<List<Sound>> _loadSounds(AssetBundle bundle) => bundle
    .loadString("assets/sounds.json")
    .then((str) => (json.decode(str) as Map).cast<String, String>())
    .then((dmap) => dmap.entries.map(Sound.fromEntry).toList());

class Sound {
  final String title;
  final String file;
  Sound(this.title, this.file);
  static Sound fromEntry(MapEntry<String, String> e) => Sound(e.key, e.value);
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext ctx) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(title: Text('Me, a peon, says')),
          body: StreamBuilder<List<Sound>>(
            stream: Stream.fromFuture(_loadSounds(DefaultAssetBundle.of(ctx))),
            builder: (_, s) => s.hasData ? SoundBoard(s.data) : Container(),
          ),
        ),
      );
}

class SoundBoard extends StatelessWidget {
  final List<Sound> sounds;
  SoundBoard(this.sounds);

  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      childAspectRatio: 2.8,
      children: sounds.map(_buttonWithSound).toList(),
    );
  }

  Widget _buttonWithSound(Sound sound) => RaisedButton(
        child: Text(sound.title),
        onPressed: () => AudioCache().play(sound.file),
        color: Colors.green,
      );
}
