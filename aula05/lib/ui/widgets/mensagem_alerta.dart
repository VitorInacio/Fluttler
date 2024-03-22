import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MensagemAlerta {

  Widget botao(BuildContext context, VoidCallback clique, String texto) {
    final tema = Theme.of(context);
    switch (tema.platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: clique, child: Text(texto));

      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: clique, child: Text(texto));
    }
  }

  // Colocar a variável entre chaves, torna ela opcional e pode ser nomeada na hora de passar o valor,
  // porém ela não pode ser nula, e para permitir o valor nulo, tem que colocar '?' no final do nome dela
  // para nomear e deixar ela obrigatória, deve colocar o required dentro das chaves e antes da variavel
  void show({required BuildContext context, required String titulo, required String texto}) {
    showAdaptiveDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog.adaptive(
          title: Text(titulo),
          content: Text(texto),
          actions: [
            botao(context, () { Navigator.pop(context); }, "Ok")
          ],
        )
    );
  }
}