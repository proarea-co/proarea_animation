// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/dio/dio_api.dart' as _i17;
import '../api/retrofit/app_api.dart' as _i15;
import '../bloc/app_controller/app_controller_cubit.dart' as _i11;
import '../bloc/home/home_cubit.dart' as _i4;
import '../bloc/posts/posts_cubit.dart' as _i13;
import '../bloc/splash/splash_cubit.dart' as _i7;
import '../bloc/users/users_cubit.dart' as _i14;
import '../routes/module/rout_module.dart' as _i16;
import '../routes/router.dart' as _i3;
import '../services/api/posts/posts_service.dart' as _i6;
import '../services/api/users/users_service.dart' as _i10;
import '../services/locale/locale_service.dart' as _i5;
import '../services/theme/theme_service.dart' as _i8;
import '../services/token/token_service.dart' as _i9;

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
  gh.factory<_i4.HomeCubit>(() => _i4.HomeCubit());
  gh.factory<_i5.LocaleService>(() => _i5.LocaleService());
  gh.factory<_i6.PostsService>(() => _i6.PostsServiceMock(),
      registerFor: {_mock});
  gh.factory<_i7.SplashCubit>(() => _i7.SplashCubit());
  gh.factory<_i8.ThemeService>(() => _i8.ThemeService());
  gh.factory<_i9.TokenService>(() => _i9.TokenService());
  gh.factory<_i10.UsersService>(() => _i10.UsersServiceMock(),
      registerFor: {_mock});
  gh.factory<_i11.AppControllerCubit>(() => _i11.AppControllerCubit(
      get<_i5.LocaleService>(), get<_i8.ThemeService>()));
  gh.lazySingleton<_i12.Dio>(() => dioModule.client(get<_i9.TokenService>()));
  gh.factory<_i13.PostsCubit>(() => _i13.PostsCubit(get<_i6.PostsService>()));
  gh.factory<_i14.UsersCubit>(() => _i14.UsersCubit(get<_i10.UsersService>()));
  gh.lazySingleton<_i15.AppApi>(
      () => appApiModule.createAppApi(get<_i12.Dio>()));
  gh.factory<_i6.PostsService>(() => _i6.PostsServiceDev(get<_i15.AppApi>()),
      registerFor: {_dev});
  gh.factory<_i10.UsersService>(() => _i10.UsersServiceDev(get<_i15.AppApi>()),
      registerFor: {_dev});
  return get;
}

class _$RoutModule extends _i16.RoutModule {}

class _$DioModule extends _i17.DioModule {}

class _$AppApiModule extends _i15.AppApiModule {}
