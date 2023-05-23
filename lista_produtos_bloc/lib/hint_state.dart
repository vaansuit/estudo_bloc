import 'package:equatable/equatable.dart';

class HintState extends Equatable {
  final String hint;

  const HintState({required this.hint});

  HintState copyWith({String? hint}) {
    return HintState(hint: hint ?? this.hint);
  }

  @override
  List<Object?> get props => [hint];
}
