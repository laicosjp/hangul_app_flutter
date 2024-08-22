import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nylo_framework/nylo_framework.dart';

///Controller for the Nylo
/// See more on controllers here - https://nylo.dev/docs/5.20.0/controllers
class Controller extends NyController {
  final _player = AudioPlayer();
  final _flutterTts = FlutterTts();

  Controller();

  playAudio(String path) {
    _player.audioCache = AudioCache(prefix: 'public/assets/');
    _player.play(AssetSource(path));
  }

  speak(String text) async {
    await _flutterTts.setLanguage('ko-KR');
    await _flutterTts.speak(text);
  }
}
