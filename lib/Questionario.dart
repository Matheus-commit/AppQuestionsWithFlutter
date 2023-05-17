import 'package:flutter/material.dart';
import './Questao.dart';
import './Resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['Resposta']
        : [];
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada].cast()['Texto']),
        //RaisedButton não aparece
        ...respostas
            .map((resp) => Resposta(resp['texto'].toString(),
                () => responder(int.parse(resp['pontuacao'].toString()))))
            .toList(),
      ],
    );
  }
}
