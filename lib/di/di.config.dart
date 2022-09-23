// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/dio/dio_api.dart' as _i11;
import '../api/retrofit/weather_api.dart' as _i9;
import '../bloc/app_controller/app_controller_cubit.dart' as _i7;
import '../routes/module/rout_module.dart' as _i10;
import '../routes/router.dart' as _i3;
import '../services/locale/locale_service.dart' as _i4;
import '../services/theme/theme_service.dart' as _i5;
import '../services/token/token_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final routModule = _$RoutModule();
  final dioModule = _$DioModule();
  final weatherApiModule = _$WeatherApiModule();
  gh.lazySingleton<_i3.AppRouter>(() => routModule.router());
  gh.factory<_i4.LocaleService>(() => _i4.LocaleService());
  gh.factory<_i5.ThemeService>(() => _i5.ThemeService());
  gh.factory<_i6.TokenService>(() => _i6.TokenService());
  gh.factory<_i7.AppControllerCubit>(() => _i7.AppControllerCubit(
      get<_i4.LocaleService>(), get<_i5.ThemeService>()));
  gh.lazySingleton<_i8.Dio>(() => dioModule.client(get<_i6.TokenService>()));
  gh.lazySingleton<_i9.WeatherApi>(
      () => weatherApiModule.weather(get<_i8.Dio>()));
  return get;
}

class _$RoutModule extends _i10.RoutModule {}

class _$DioModule extends _i11.DioModule {}

class _$WeatherApiModule extends _i9.WeatherApiModule {}
