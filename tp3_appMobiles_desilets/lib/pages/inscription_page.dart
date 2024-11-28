import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InscriptionPage extends StatefulWidget {
  InscriptionPage({super.key});
  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Inscription"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Nom d\'utilisateur:",
            ),
            TextField(controller: textEditingController, decoration: InputDecoration(hintText: "Nom d\'utilisateur:"),),
            const Text(
              "Mot de passe:",
            ),
            TextField(controller: textEditingController, decoration: InputDecoration(hintText: "Mot de passe"),),
            OutlinedButton(onPressed: (){
              //TODO Inscrire l'utilisateur avec le nom d'utilisateur et le mot de passe.

            }, child: Text("Inscription")),

            OutlinedButton(onPressed: (){
              //TODO Rediriger vers la page de connexion.
            }, child: Text("Connexion")),
          ],
        ),
      ),
    );
  }
}