import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Marca extends Equatable {
  int? id;

  String? nome;

  Marca({
    this.id,
    this.nome,
  });

  @override
  String toString() {
    return 'Marca{id: $id,nome: $nome}';
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nome": nome,
    };
  }

  factory Marca.fromJson(Map<String, dynamic> json) {
    return Marca(
      id: json["id"] == null ? null : int.parse(json["id"].toString()),
      nome: json["nome"] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        nome,
      ];
}
