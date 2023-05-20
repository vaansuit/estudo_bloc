import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class CounterEventIncrement extends CounterEvent {}

class CounterEventDecrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    //Definindo valor inicial como 0
    on<CounterEventIncrement>(
      (event, emit) {
        emit(state + 1); //Atribuindo uma função para o evento
      },
    );

    on<CounterEventDecrement>(
      (event, emit) {
        emit(state - 1); //Atribuindo uma função para o evento
      },
    );
  }
}

Future<void> main() async {
  final bloc = CounterBloc();
  final subscription = bloc.stream.listen(print); // 1
  bloc.add(CounterEventIncrement());
  bloc.add(CounterEventIncrement());
  bloc.add(CounterEventDecrement());
  bloc.add(CounterEventDecrement());
  bloc.add(CounterEventDecrement());
  bloc.add(CounterEventIncrement());
  bloc.add(CounterEventIncrement());
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await bloc.close();
}
