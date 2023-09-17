import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:music_app/core/services/audio_service/audio_player_service.dart';

import '../../../errors/exceptions.dart';

class AudioPlayerServiceImpl extends GetxService implements AudioPlayerService {
  final AudioPlayer audioPlayer;

  AudioPlayerServiceImpl(this.audioPlayer);

  @override
  Future<int> get getCurrentPosition async {
    try {
      final position = await audioPlayer.getCurrentPosition();
      return position?.inSeconds ?? 0;
    } catch (error, stackTrace) {
      String errorMessage = 'Erro ao pegar a posição da musica';
      // log(
      //     // errorMessage,
      //     // error: error, stackTrace: stackTrace,
      // );
      throw AudioPlayerException(message: errorMessage);
    }
  }

  @override
  Stream<Duration> getPositionStream() {
    return audioPlayer.onPositionChanged;
  }

  @override
  Stream<void> onAudioComplete() {
    return audioPlayer.onPlayerComplete;
  }

  @override
  Future<void> pauseMusic() {
    return callAudioPlayerServiceTryAndCathFunction(
        () => audioPlayer.pause(), 'Erro ao pausar a musica');
  }

  @override
  Future<void> playMusic(String audioAsset) {
    return callAudioPlayerServiceTryAndCathFunction(
        () => audioPlayer.play(AssetSource(audioAsset)),
        'Erro ao dar play musica');
  }

  @override
  Future<void> resumeMusic() {
    return callAudioPlayerServiceTryAndCathFunction(
        () => audioPlayer.resume(), 'Erro ao continuar a musica');
  }

  @override
  Future<void> seek(int seconds) {
    return callAudioPlayerServiceTryAndCathFunction(() {
      final seekTo = Duration(seconds: seconds);
      return audioPlayer.seek(seekTo);
    }, 'Erro ao trocar duração da musica');
  }

  @override
  Future<void> stopMusic() {
    return callAudioPlayerServiceTryAndCathFunction(
        () => audioPlayer.stop(), 'Erro ao parar a musica');
  }

  Future<void> callAudioPlayerServiceTryAndCathFunction(
      Future<void> Function() tryFunction,
      String audioPlayerExceptionMessage) async {
    try {
      await tryFunction();
    } catch (error, stackTrace) {
      final String errorMessage = audioPlayerExceptionMessage;
      // log(
      //     // errorMessage,
      //     // error: error, stackTrace: stackTrace,
      // );
      throw AudioPlayerException(message: errorMessage);
    }
  }

  @override
  void onClose() {
    audioPlayer
      ..stop()
      ..dispose();
    super.onClose();
  }
}
