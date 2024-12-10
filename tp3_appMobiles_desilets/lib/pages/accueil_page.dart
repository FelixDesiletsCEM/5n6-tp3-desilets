import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/tiroir_nav.dart';
import '../generated/l10n.dart';
import '../service.dart';
import '../Model/transfert.dart';
import 'consultation_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  var listeTaches;
  final database = FirebaseFirestore.instance;

  void getList() async
  {
  QuerySnapshot<Task> taches = await repoOfCurrentUser.get();
  listeTaches = taches.docs;
    print(listeTaches.toString());
    setState(() {});
  }

  @override
  void initState() {
    firebase_auth.FirebaseAuth.instance
        .authStateChanges()
        .listen((firebase_auth.User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in! ' + user.email!);
      }
    });

    super.initState();
    getList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageAccueilTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(child:
            ListView(
              children:
              (listeTaches!=null)?
                  //NOTE: Vu que le taskDoc n'est pas dynamique, si il y a un item dans firebase
                  //qui n'est pas convertissable en Task, l'app crash.
              listeTaches.map<Widget>( (QueryDocumentSnapshot<Task> taskDoc) => ListTile(
                onTap: (){Navigator.push(//Quand on appuis, redirige vers les détails de la task.
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConsultationPage(task: taskDoc),
                  ),
                );},
                leading: Image.network(taskDoc.data().imageUrl),//TODO remplacer par une image.
                  title: Text(taskDoc.data().name),
                  subtitle: Text("Deadline: " + taskDoc.data().deadline.toIso8601String() + " (${calculPourcentage(taskDoc.data().creationDate, taskDoc.data().deadline).toString()}%)"),
                  trailing: Text(taskDoc.data().percentageDone.toString() + "% done")
                )).toList()
                  :[ListTile(title: Text(S.of(context).pageAccueilLoading))].toList(),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getList,
        tooltip: S.of(context).pageAccueilActualiserListe,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
