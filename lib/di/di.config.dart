// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/dio/dio_api.dart' as _i16;
import '../api/retrofit/app_api.dart' as _i14;
import '../bloc/app_controller/app_controller_cubit.dart' as _i10;
import '../bloc/posts/posts_cubit.dart' as _i12;
import '../bloc/splash/splash_cubit.dart' as _i6;
import '../bloc/users/users_cubit.dart' as _i13;
import '../routes/module/rout_module.dart' as _i15;
import '../routes/router.dart' as _i3;
import '../services/api/posts/posts_service.dart' as _i5;
import '../services/api/users/users_service.dart' as _i9;
import '../services/locale/locale_service.dart' as _i4;
import '../services/theme/theme_service.dart' as _i7;
import '../services/token/token_service.dart' as _i8;

const String _mock = 'mock';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final routModule = _$RoutModule();
  final dioModule = _$DioModule();
  final appApiModule = _$AppApiModule();
  gh.lazySingleton<_i3.AppRouter>(() => routModule.router());
  gh.factory<_i4.LocaleService>(() => _i4.LocaleService());
  gh.factory<_i5.PostsService>(() => _i5.PostsServiceMock(),
      registerFor: {_mock});
  gh.factory<_i6.SplashCubit>(() => _i6.SplashCubit());
  gh.factory<_i7.ThemeService>(() => _i7.ThemeService());
  gh.factory<_i8.TokenService>(() => _i8.TokenService());
  gh.factory<_i9.UsersService>(() => _i9.UsersServiceMock(),
      registerFor: {_mock});
  gh.factory<_i10.AppControllerCubit>(() => _i10.AppControllerCubit(
      get<_i4.LocaleService>(), get<_i7.ThemeService>()));
  gh.lazySingleton<_i11.Dio>(() => dioModule.client(get<_i8.TokenService>()));
  gh.factory<_i12.PostsCubit>(() => _i12.PostsCubit(get<_i5.PostsService>()));
  gh.factory<_i13.UsersCubit>(() => _i13.UsersCubit(get<_i9.UsersService>()));
  gh.lazySingleton<_i14.AppApi>(
      () => appApiModule.createAppApi(get<_i11.Dio>()));
  gh.factory<_i5.PostsService>(() => _i5.PostsServiceDev(get<_i14.AppApi>()),
      registerFor: {_dev});
  gh.factory<_i9.UsersService>(() => _i9.UsersServiceDev(get<_i14.AppApi>()),
      registerFor: {_dev});
  return get;
}

class _$RoutModule extends _i15.RoutModule {}

class _$DioModule extends _i16.DioModule {}

class _$AppApiModule extends _i14.AppApiModule {}
