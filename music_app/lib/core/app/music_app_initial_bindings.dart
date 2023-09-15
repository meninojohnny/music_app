import 'package:get/get.dart';
import 'package:music_app/core/services/audio_service/audio_player_service_impl.dart';
import 'package:music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import '../services/api_services.dart';

class MusicAppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());

    Get.put(AudioPlayerServiceImpl());

    Get.lazyPut(() => MusicPlayerController);
  }
}
