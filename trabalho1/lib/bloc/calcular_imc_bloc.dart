import 'package:flutter/cupertino.dart';
import 'package:trabalho1/ui/widgets/mensagem_alerta.dart';

class CalcularImcBloc {
  final BuildContext context;
  String res = '';
  final pesoC = TextEditingController();
  final alturaC = TextEditingController();

  CalcularImcBloc(this.context);

  void calcular() {
    final pesoV = double.tryParse(pesoC.text);
    final alturaV = double.tryParse(alturaC.text);

    if (pesoV != null && alturaV != null && alturaV > 0) {
      final imc = pesoV / (alturaV * alturaV);
      res = imc.toStringAsFixed(2);

      String classificacao = '';
      if (imc < 18.5) {
        classificacao = 'Abaixo do peso';
      } else if (imc >= 18.5 && imc < 25) {
        classificacao = 'Peso normal';
      } else if (imc >= 25 && imc < 30) {
        classificacao = 'Sobrepeso';
      } else if (imc >= 30 && imc < 35) {
        classificacao = 'Obesidade grau 1';
      } else if (imc >= 35 && imc < 40) {
        classificacao = 'Obesidade grau 2';
      } else {
        classificacao = 'Obesidade grau 3 (obesidade mórbida)';
      }

      final mensagem = MensagemAlerta();
     mensagem.show(context: context, titulo: 'Resultado', texto: 'Seu IMC é $res. Classificação: $classificacao',);

    } else {
      final mensagem = MensagemAlerta();
      mensagem.show(context: context, titulo: 'Erro', texto: 'Por favor, insira valores válidos.');
    }
  }
}
