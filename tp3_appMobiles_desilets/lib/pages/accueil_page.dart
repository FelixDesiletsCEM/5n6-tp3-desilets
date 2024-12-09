import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/tiroir_nav.dart';
import '../service.dart';
import '../Model/transfert.dart';
import 'consultation_page.dart';
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
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
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
      drawer: LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Accueil"),
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
                    builder: (context) => ConsultationPage(task: taskDoc.data()!),
                  ),
                );},
                leading: Text(""),//TODO remplacer par une image.
                  title: Text(taskDoc.data()!.name), 
                  subtitle: Text(taskDoc.data()!.deadline.toIso8601String()),
                  trailing: Text(taskDoc.data()!.percentageDone.toString()),)).toList()
                  :[ListTile(title: Text("Loading"))].toList(),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getList,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
