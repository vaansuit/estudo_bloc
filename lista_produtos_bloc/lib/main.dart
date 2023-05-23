import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:lista_produtos_bloc/hint_event.dart';
import 'package:lista_produtos_bloc/hint_state.dart';

import 'hint_bloc.dart';
import 'marca.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Lista com Bloc e TypeAheadField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Map<String, String?>> getSuggestions(String query) {
    final List<Marca> marcasList = [
      Marca(
        id: 1,
        nome: 'marca teste 1',
      ),
      Marca(
        id: 2,
        nome: 'marca teste 2',
      ),
      Marca(
        id: 3,
        nome: 'marca teste 3',
      ),
      Marca(
        id: 4,
        nome: 'marca teste 4',
      ),
      Marca(
        id: 5,
        nome: 'marca teste 5',
      ),
    ];
    Future<void>.delayed(const Duration(seconds: 1));

    return marcasList.map((marca) {
      return {'id': marca.id.toString(), 'marca': marca.nome};
    }).toList();
  }

  late HintBloc _hintBloc;

  @override
  void initState() {
    super.initState();
    _hintBloc = HintBloc();
    _hintBloc.add(const HintUpdated(marca: ''));
  }

  @override
  void dispose() {
    _hintBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<HintBloc, HintState>(
        bloc: _hintBloc,
        buildWhen: (previous, current) {
          return previous.hint != current.hint;
        },
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                TypeAheadField(
                  suggestionsCallback: (pattern) {
                    return getSuggestions(pattern);
                  },
                  itemBuilder: (context, itemData) {
                    final marca = itemData['marca'];
                    return ListTile(
                      title: Text('$marca'),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    debugPrint('Testando $suggestion');
                    debugPrint('Testando $state');

                    final marca = suggestion['marca'];
                    _hintBloc.add(
                      HintUpdated(marca: marca),
                    );
                    debugPrint('Testando $marca');
                  },
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      hintText: state.hint,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
