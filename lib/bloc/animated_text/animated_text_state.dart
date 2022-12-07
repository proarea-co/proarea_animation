part of 'animated_text_cubit.dart';

class AnimatedTextState extends BaseState {
  final int length;
  final int index;

  const AnimatedTextState({
    super.status,
    super.message,
    this.length = 0,
    this.index = 0,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      length,
      index,
    ];
  }

  AnimatedTextState copyWith({
    StateStatus? status,
    String? message,
    int? length,
    int? index,
  }) {
    return AnimatedTextState(
      status: status ?? this.status,
      message: message ?? this.message,
      length: length ?? this.length,
      index: index ?? this.index,
    );
  }
}
