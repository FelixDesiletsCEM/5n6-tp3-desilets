import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/pages/accueil_page.dart';
import 'package:tp3_appmobiles_desilets/pages/connexion_page.dart';
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
        //TODO Prendre le courriel pour de vrai. Surement créer un singleton lors du login?
        Text("Courriel de l'utilisateur connecté"),
        //Déconnexion
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: Text("Déconnexion"),
          onTap: () async{
            // TODO déconnecter l'utilisateur.
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

        ListTile(
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