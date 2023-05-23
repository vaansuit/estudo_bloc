import 'package:equatable/equatable.dart';

abstract class HintEvent extends Equatable {
  const HintEvent();

  @override
  List<Object?> get props => [];
}

class HintUpdated extends HintEvent {
  final String? marca;

  const HintUpdated({required this.marca});

  @override
  List<Object?> get props => [marca];
}
