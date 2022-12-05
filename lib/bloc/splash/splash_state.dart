part of 'splash_cubit.dart';

abstract class SplashState extends BaseState {
  const SplashState({
    super.status,
    super.message,
  });
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoaded extends SplashState {
  const SplashLoaded();
}
