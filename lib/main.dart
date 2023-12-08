import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = []; //armazena as tarefas

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  //_getFile() pega o arquivo que vamos utilizar para salvar os dados
  Future<File> _getFile() async {
    //pega o diretório onde podemos armazenar os docs do app
    final directory = await getApplicationDocumentsDirectory();
    //pega o caminho(.path) do diretório junto com o data.json e abre o file
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    //pega a lista, transforma em json e armazena em uma string
    String data = json.encode(_toDoList);
    final file = await _getFile(); //pega o arquivo onde vamos salvar
    return file
        .writeAsString(data); //pega o arquivo, escrevemos os dados como texto
  }

  Future<String?> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
