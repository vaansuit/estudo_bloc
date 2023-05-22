import 'package:bloc/bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  //Agora é apenas necessário informar as funções necessárias, no nosso caso, incrementar e decrementar os valores

  void increment() => emit(
        CounterState(
          counterValue: state.counterValue + 1,
          wasIncremented: true,
        ),
      ); //Aqui eu emito um novo estado CounterState, que é igual o estado atual (state.counterValue) + 1. Com a palavra state podemos acessar o valor do nosso estado atual

  void decrement() => emit(
        CounterState(
          counterValue: state.counterValue - 1,
          wasIncremented: false,
        ),
      );
}
