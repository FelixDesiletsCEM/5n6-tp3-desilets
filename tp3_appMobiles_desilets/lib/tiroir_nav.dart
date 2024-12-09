import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tp3_appmobiles_desilets/pages/accueil_page.dart';
import 'package:tp3_appmobiles_desilets/pages/connexion_page.dart';
import 'package:tp3_appmobiles_desilets/pages/creation_page.dart';
class LeTiroir extends StatefulWidget {
  const LeTiroir({super.key});

  @override
  State<LeTiroir> createState() => LeTiroirState();
}

class LeTiroirState extends State<LeTiroir> {
  @override
  Widget build(BuildContext context) {

    var listView = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 200,
        ),
        Text(FirebaseAuth.instance.currentUser?.email ?? ""),

        ListTile(//Déconnexion de l'utilisateur
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: Text("Déconnexion"),
          onTap: () async{
            await GoogleSignIn().signOut();
            await FirebaseAuth.instance.signOut();
            setState(() {});
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConnexionPage(),
              ),
            );
            // Then close the drawer
          },
        ),

        ListTile(//Redirige vers Accueil
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: Text("Accueil"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccueilPage(),
              ),
            );
            // Then close the drawer
          },
        ),
        ListTile(//Redirige vers Creation
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: Text("Creation"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreationPage(),
              ),);
          },
        ),
      ],
    );

    return Drawer(
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: listView,
      ),
    );
  }
}