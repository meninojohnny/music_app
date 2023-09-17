class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});
}

class GeneralExceptions implements Exception {
  final String message;

  GeneralExceptions(
      {this.message = 'Ocorreu um erro. Por favor, tente novamente.'});
}

class AudioPlayerException implements Exception {
  final String message;
  AudioPlayerException({required this.message});
}
