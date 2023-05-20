Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    print('Sent boat no. ' + i.toString());
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> arguments) {
  Stream<int> stream = boatStream();

  stream.listen((receivedData) {
    print('Received boat no. ' + receivedData.toString());
  });
}

/*

  O for loop determina que 100 barcos serão enviados
  O await Future.delayed é o tempo que o barco demora para chegar até a outra ponta, ou seja 2 segundos
  Uma stream precisa ser uma função assincrona, porque nos gera um tipo de dado assincrono, marcando com o async*
  O yield é o que empurra o barco para o rio (stream). Toda vez que nós chamamos o yield, nós mandamos os nossos dados (no caso, barcos) pelo rio (stream)
  O await é a palavra chave que utilizamos para falar quanto tempo temos de esperar até enviar o proximo barco. 
  Na função main, tudo que precisa ser feito é inicializar a stream, então nós escutaremos (listen) a stream. 
  Lembrar que nós precisamos sempre estar escutando para saber quando os dados estão chegando, caso contrário nós não saberemos se os dados mudaram ou não
  


 */