import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {

  HomeCubit() : super(const HomeState());

  @override
  void handleError(String massage) {
    emit(state.copyWith(
      status: StateStatus.error,
      message: massage,
    ));
  }


  void setCanBeDragged(bool? canBeDragged) {
    emit(state.copyWith(canBeDragged: canBeDragged));
  }
}
