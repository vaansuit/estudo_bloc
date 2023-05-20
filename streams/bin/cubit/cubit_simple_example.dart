import 'package:bloc/bloc.dart';

class CubitSimpleExample extends Cubit<int> {
  CubitSimpleExample()
      : super(0); //Aqui está sendo definido o estado inicial do cubit como zero

  void increment() => emit(state + 1); //Definindo a função para incrementar
  void decrement() => emit(state - 1); //Definindo a função para decrementar
}

void main(List<String> args) {
  final cubit = CubitSimpleExample(); //Instanciando o cubit criado

  print(cubit.state); //Deve mostrar 0;

  cubit.increment(); //Incrementa +!

  print(cubit.state); //Deve mostrar 1

  cubit.increment(); //Incrementa +!

  print(cubit.state); //Deve mostrar 2

  cubit.decrement(); //Decrementa -1

  print(cubit.state); //Deve mostrar 1

  cubit.close(); //Fechando a instancia
}
