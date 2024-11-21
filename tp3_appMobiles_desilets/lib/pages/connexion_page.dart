import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Connexion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Nom d\'utilisateur:",
            ),
            TextField(controller: textEditingController, decoration: InputDecoration(hintText: "Nom d\'utilisateur"),),
            const Text(
              "Mot de passe:",
            ),
            TextField(controller: textEditingController, decoration: InputDecoration(hintText: "Mot de passe"),),
            //TODO Connecter l'utilisateur avec le nom d'utilisateur et le mot de passe.
            OutlinedButton(onPressed: (){}, child: Text("Connexion")),
            //TODO Connecter l'utilisateur avec un compte Google.
            OutlinedButton(onPressed: (){}, child: Text("Connexion avec Google")),
            //TODO Rediriger vers la page d'inscription.
            OutlinedButton(onPressed: (){}, child: Text("Inscription")),
          ],
        ),
      ),
    );
  }
}