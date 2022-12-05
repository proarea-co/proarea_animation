import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../models/tab_item/tab_item.dart';

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

  void init(List<TabItem>? tabs) {
    emit(state.copyWith(tabs: tabs));
  }

  void setCanBeDragged(bool? canBeDragged) {
    emit(state.copyWith(canBeDragged: canBeDragged));
  }
}
