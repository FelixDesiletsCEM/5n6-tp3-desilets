import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/main.dart';
import 'package:tp3_appmobiles_desilets/pages/inscription_page.dart';

import '../tiroir_nav.dart';
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
      //TODO Enlever le tiroir.
      drawer: LeTiroir(),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccueilPage(),
                ),
              );
            }, child: Text("Connexion")),

            OutlinedButton(onPressed: ()async{
              //TODO Connecter l'utilisateur avec un compte Google.
              try
              {
              await signInWithGoogle();

              User? user = FirebaseAuth.instance.currentUser;

              final db = FirebaseFirestore.instance;
              //TODO Ajouter un if pour par rajouter l'utilisateur à la bd si il existe déjà.
              String firstname = user!.displayName!.split(" ")[0];
              String lastname = user!.displayName!.split(" ")[1];
              final tempUser = <String, dynamic>{
                "first": firstname,
                "last": lastname,
                "born": 2000,
                "email": user!.email != null?user!.email.toString():"",
                "id": user!.uid != null?user!.uid:"",
              };
              //Ajoute l'utilisateur (avec comme Id de document son uid).
              db.collection("users").doc(user.uid).set(tempUser)/*.then((DocumentReference doc) =>
                  print('DocumentSnapshot added with ID: ${doc.id}'))*/;
              setState(() {});
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccueilPage(),
                ),
              );
              }
              catch(e){
                print(e);
              }



            },
                child: Text("Connexion avec Google")),

            OutlinedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InscriptionPage(),
                ),
              );
            }, child: Text("Inscription")),
          ],
        ),
      ),
    );
  }
}