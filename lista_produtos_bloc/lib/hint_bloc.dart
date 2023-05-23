import 'package:flutter_bloc/flutter_bloc.dart';
import 'hint_event.dart';
import 'hint_state.dart';

class HintBloc extends Bloc<HintEvent, HintState> {
  HintBloc() : super(const HintState(hint: '')) {
    on<HintUpdated>(_onMarcaChanged);
  }

  void _onMarcaChanged(
    HintUpdated event,
    Emitter<HintState> emit,
  ) {
    final hint = event.marca;

    emit(
      state.copyWith(hint: hint),
    );
  }
}
