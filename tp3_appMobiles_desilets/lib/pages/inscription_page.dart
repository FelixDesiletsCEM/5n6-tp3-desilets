import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/pages/connexion_page.dart';
import '../Model/transfert.dart';
import '../generated/l10n.dart';
import '../service.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});
  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageInscriptionTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text('${S.of(context).pageConnexionNom}:'),
            TextField(controller: textEditingController, decoration: InputDecoration(hintText: S.of(context).pageConnexionNom),),
             Text('${S.of(context).pageConnexionMotDePasse}:'),
            TextField(controller: textEditingController, decoration: InputDecoration(hintText: S.of(context).pageConnexionMotDePasse),),
            OutlinedButton(onPressed: (){
              //TODO Inscrire l'utilisateur avec le nom d'utilisateur et le mot de passe.
              Person person = new Person("nom", "mdp", "test@test.com");
              //Ajoute l'utilisateur (avec comme Id de document son uid, généré par firebase).
              collectionUsers.doc(currentUser!.uid).set(person)/*.then((DocumentReference doc) =>
                  print('DocumentSnapshot added with ID: ${doc.id}'))*/;
            }, child: Text(S.of(context).pageInscriptionTitre)),

            OutlinedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConnexionPage(),
                ),
              );
            }, child: Text(S.of(context).pageConnexionTitre)),
          ],
        ),
      ),
    );
  }
}