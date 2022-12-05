import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  @override
  void handleError(String massage) {}

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(const SplashLoaded());
  }
}
