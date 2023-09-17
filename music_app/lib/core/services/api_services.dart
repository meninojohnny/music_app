import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:music_app/errors/exceptions.dart';
import 'package:music_app/shared/models/genre_model.dart';

import '../../shared/models/genre_details_model.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModel>> getGenres() async {
    try {
      const endPoint = "/genres";
      final response = await get(endPoint);

      return (response.data as List)
          .map((genre) => GenreModel.fromMap(genre))
          .toList();

      // ignore: deprecated_member_use
    } on DioError catch (dioError, stackTrace) {
      log(1
          // 'Erro ao fazer o get dos generos musicais',
          // error: dioError,
          // stackTrace: stackTrace,
          );
      throw ApiException(
        message: 'Erro ao carregar generos',
        statusCode: dioError.response?.statusCode,
      );
    } catch (error) {
      log(1
          // 'Erro ao fazer o get dos generos musicais',
          // error: error,
          // StackTrace: StackTrace,
          );
      throw GeneralExceptions();
    }
  }

  Future<GenreDetailsModel> getGenreDetails({required String genre}) async {
    try {
      final endPoint = "/genres/$genre";
      final response = await get(endPoint);

      return GenreDetailsModel.fromMap(response.data);

      // ignore: deprecated_member_use
    } on DioError catch (dioError, stackTrace) {
      log(1
          // 'Erro ao fazer o get dos detalhes generos musicais',
          // error: dioError,
          // stackTrace: stackTrace,
          );
      throw ApiException(
        message: 'Erro ao fazer o get dos detalhes generos musicais',
        statusCode: dioError.response?.statusCode,
      );
    } catch (error) {
      log(1
          // 'Erro ao fazer o get dos detalhes generos musicais',
          // error: error,
          // StackTrace: StackTrace,
          );
      throw GeneralExceptions();
    }
  }
}
