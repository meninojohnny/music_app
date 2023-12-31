import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:music_app/core/services/audio_service/audio_player_service_impl.dart';
import 'package:music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import '../services/api_services.dart';
import '../services/dot_env_service.dart';

class MusicAppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ApiService(
        BaseOptions(
          baseUrl: DotEnvService.getApiBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ),
    );

    Get.put(AudioPlayerServiceImpl(AudioPlayer()));

    Get.lazyPut(() => MusicPlayerController);
  }
}
