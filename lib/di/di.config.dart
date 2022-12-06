// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/dio/dio_api.dart' as _i18;
import '../api/retrofit/app_api.dart' as _i16;
import '../bloc/animated_text/animated_text_cubit.dart' as _i3;
import '../bloc/app_controller/app_controller_cubit.dart' as _i12;
import '../bloc/home/home_cubit.dart' as _i5;
import '../bloc/posts/posts_cubit.dart' as _i14;
import '../bloc/splash/splash_cubit.dart' as _i8;
import '../bloc/users/users_cubit.dart' as _i15;
import '../routes/module/rout_module.dart' as _i17;
import '../routes/router.dart' as _i4;
import '../services/api/posts/posts_service.dart' as _i7;
import '../services/api/users/users_service.dart' as _i11;
import '../services/locale/locale_service.dart' as _i6;
import '../services/theme/theme_service.dart' as _i9;
import '../services/token/token_service.dart' as _i10;

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
  gh.factory<_i3.AnimatedTextCubit>(() => _i3.AnimatedTextCubit());
  gh.lazySingleton<_i4.AppRouter>(() => routModule.router());
  gh.factory<_i5.HomeCubit>(() => _i5.HomeCubit());
  gh.factory<_i6.LocaleService>(() => _i6.LocaleService());
  gh.factory<_i7.PostsService>(() => _i7.PostsServiceMock(),
      registerFor: {_mock});
  gh.factory<_i8.SplashCubit>(() => _i8.SplashCubit());
  gh.factory<_i9.ThemeService>(() => _i9.ThemeService());
  gh.factory<_i10.TokenService>(() => _i10.TokenService());
  gh.factory<_i11.UsersService>(() => _i11.UsersServiceMock(),
      registerFor: {_mock});
  gh.factory<_i12.AppControllerCubit>(() => _i12.AppControllerCubit(
      get<_i6.LocaleService>(), get<_i9.ThemeService>()));
  gh.lazySingleton<_i13.Dio>(() => dioModule.client(get<_i10.TokenService>()));
  gh.factory<_i14.PostsCubit>(() => _i14.PostsCubit(get<_i7.PostsService>()));
  gh.factory<_i15.UsersCubit>(() => _i15.UsersCubit(get<_i11.UsersService>()));
  gh.lazySingleton<_i16.AppApi>(
      () => appApiModule.createAppApi(get<_i13.Dio>()));
  gh.factory<_i7.PostsService>(() => _i7.PostsServiceDev(get<_i16.AppApi>()),
      registerFor: {_dev});
  gh.factory<_i11.UsersService>(() => _i11.UsersServiceDev(get<_i16.AppApi>()),
      registerFor: {_dev});
  return get;
}

class _$RoutModule extends _i17.RoutModule {}

class _$DioModule extends _i18.DioModule {}

class _$AppApiModule extends _i16.AppApiModule {}
