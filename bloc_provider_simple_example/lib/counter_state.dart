class CounterState {
  int counterValue;
  bool? wasIncremented;
  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });
}


/**
 Essa classe é onde nós vamos infomar todos os estados possíveis, que será emitido pelo nosso bloc 
 Aqui nós estamos falando que nosso estado irá ter obrigatoriamente uma variavel inteira chamada counterValue, então passamos isso para o nosso construtor
 O estado inicial será definido no nosso cubit
 
 */