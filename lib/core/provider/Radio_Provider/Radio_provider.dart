import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:islamiapp/core/Services/models/radio.dart';

import '../../Services/Api Manager/Api Manager.dart';

class RadioProvider extends ChangeNotifier {
  List<RadioModel> radios = [];

  bool isLoading = true;
  bool isError = false;

  int _currentIndex = 0;


  final player = AudioPlayer();


  Future<void> getRadios() async {
    var res = await ApiService.getRadio();
    res.fold((l) {
      isLoading = false;
      isError = true;
    }, (r) {
      radios = r;
      isLoading = false;
    });

    isLoading = false;
    notifyListeners();
  }

  RadioModel get curRadio => radios[_currentIndex];


  bool get isPlaying => player.state == PlayerState.playing;
  void play(){

    if(player.state == PlayerState.playing){
      player.pause();
    }
    else if(player.state == PlayerState.paused){
      player.resume();
    }
    else {
    player.play(UrlSource(radios[_currentIndex].url ));

    }
    notifyListeners();

  }

  next(){
    if(radios.length-1 == _currentIndex){
      return;
    }
    _currentIndex++;
    player.stop();
    notifyListeners();

  }

  previous(){
    if(_currentIndex==0){
      return;
    }
    _currentIndex--;
     player.stop();
     notifyListeners();
  }
}
