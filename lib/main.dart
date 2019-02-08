import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Me, a peon, says',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Me, a peon, says'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static AudioCache player = new AudioCache();

  void _play(String title) {
    player.play(title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Row(children: <Widget>[
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                RaisedButton(
                  child: Text("Be Happy To"),
                  onPressed: () => _play("be_happy_to.mp3"),
                ),
                RaisedButton(
                  child: Text("Dedam"),
                  onPressed: () => _play("dedam.mp3"),
                ),
                RaisedButton(
                  child: Text("Huh?"),
                  onPressed: () => _play("huh.mp3"),
                ),
                RaisedButton(
                  child: Text("I can do that"),
                  onPressed: () => _play("i_can_do_that.mp3"),
                ),
                RaisedButton(
                  child: Text("I'll try"),
                  onPressed: () => _play("i_ll_try.mp3"),
                ),
                RaisedButton(
                  child: Text("Me Busy"),
                  onPressed: () => _play("me_busy_leave_me_alone.mp3"),
                ),
                RaisedButton(
                  child: Text("Me Not That Kind Of Orc"),
                  onPressed: () => _play("me_not_that_kind_of_orc.mp3"),
                ),
                RaisedButton(
                  child: Text("No time for play"),
                  onPressed: () => _play("no_time_for_play.mp3"),
                ),
              ])),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Okay"),
                onPressed: () => _play("okay.mp3"),
              ),
              RaisedButton(
                child: Text("OkeyDokey"),
                onPressed: () => _play("okeydokey.mp3"),
              ),
              RaisedButton(
                child: Text("Ready to work"),
                onPressed: () => _play("ready_to_work.mp3"),
              ),
              RaisedButton(
                child: Text("Something need doing"),
                onPressed: () => _play("something_need_doing.mp3"),
              ),
              RaisedButton(
                child: Text("Whaaat?"),
                onPressed: () => _play("whaaat.mp3"),
              ),
              RaisedButton(
                child: Text("What do you want ?"),
                onPressed: () => _play("what_do_you_want.mp3"),
              ),
              RaisedButton(
                child: Text("Work work"),
                onPressed: () => _play("work_work.mp3"),
              ),
              RaisedButton(
                child: Text("Yes"),
                onPressed: () => _play("yes.mp3"),
              ),
            ],
          ))
        ])));
  }
}
