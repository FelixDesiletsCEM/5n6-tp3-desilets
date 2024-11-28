import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/main.dart';

import 'accueil_page.dart';

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

            OutlinedButton(onPressed: (){
              //TODO Connecter l'utilisateur avec le nom d'utilisateur et le mot de passe.

            }, child: Text("Connexion")),

            OutlinedButton(onPressed: (){
              //TODO Connecter l'utilisateur avec un compte Google.
              print(signInWithGoogle().toString());
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => const AccueilPage(),
              ),
              );},
                child: Text("Connexion avec Google")),

            OutlinedButton(onPressed: (){
              //TODO Rediriger vers la page d'inscription.
            }, child: Text("Inscription")),
          ],
        ),
      ),
    );
  }
}