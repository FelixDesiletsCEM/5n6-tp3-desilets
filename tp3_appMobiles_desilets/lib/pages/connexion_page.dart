import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tp3_appmobiles_desilets/pages/inscription_page.dart';
import '../Model/transfert.dart';
import '../generated/l10n.dart';
import '../service.dart';
import '../tiroir_nav.dart';
import 'accueil_page.dart';
import 'package:image_picker/image_picker.dart';
class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  TextEditingController UsernameController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageConnexionTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${S.of(context).pageConnexionNom}:'),
            TextField(controller: UsernameController, decoration: InputDecoration(hintText: S.of(context).pageConnexionNom),),
            Text('${S.of(context).pageConnexionMotDePasse}:'),
            TextField(controller: PasswordController, decoration: InputDecoration(hintText: S.of(context).pageConnexionMotDePasse),),

            OutlinedButton(onPressed: () async {
              try
              {
                await FirebaseAuth.instance.signInWithEmailAndPassword(email: UsernameController.text, password: PasswordController.text);
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
            }, child: Text(S.of(context).pageConnexionConnexion)),

            OutlinedButton(onPressed: ()async{
              try
              {
              await signInWithGoogle();
              /*String firstname = currentUser!.displayName!.split(" ")[0];
              String lastname = currentUser!.displayName!.split(" ")[1];
              final tempUser = <String, dynamic>{
                "first": firstname,
                "last": lastname,
                "born": "",
                "email": currentUser!.email.toString()??"",
                "id": currentUser!.uid ?? "",
              };
              Person person = new Person("nom", "mdp", "test@test.com");
              //Ajoute l'utilisateur (avec comme Id de document son uid).
              FirebaseFirestore.instance.doc(currentUser!.uid).set(tempUser)*//*.then((DocumentReference doc) =>
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
                child: Text(S.of(context).pageConnexionConnexionGoogle)),

            OutlinedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InscriptionPage(),
                ),
              );
            }, child: Text(S.of(context).pageInscriptionTitre)),

          ],
        ),
      ),
    );
  }
}