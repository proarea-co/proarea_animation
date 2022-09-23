import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET('/weather/{location}')
  Future<String> getWeatherCity(@Path('location') String location);
}

@module
abstract class WeatherApiModule {
  @lazySingleton
  WeatherApi weather(Dio dio) => WeatherApi(dio);
}
