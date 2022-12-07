import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';

part 'animated_text_state.dart';

@injectable
class AnimatedTextCubit extends BaseCubit<AnimatedTextState> {
  AnimatedTextCubit() : super(const AnimatedTextState());

  @override
  void handleError(String massage) {
    emit(state.copyWith(
      status: StateStatus.error,
      message: massage,
    ));
  }

  void setLength(int? length) {
    emit(state.copyWith(length: length));
  }

  void next() {
    performSafeAction(() async {
      assert(state.length > 0);
      emit(state.copyWith(index: (state.index + 1) % state.length));
    });
  }
}
