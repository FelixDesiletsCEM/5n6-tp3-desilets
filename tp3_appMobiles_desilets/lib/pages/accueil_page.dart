import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tp3_appmobiles_desilets/tiroir_nav.dart';
import '../service.dart';
import '../Model/transfert.dart';
class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  var listeItem;

  final database = FirebaseFirestore.instance;
//TODO S'arranger pour que currentUser devienne un User plutôt qu'un ?User. Ce serait moins chiant.
  User? currentUser = FirebaseAuth.instance.currentUser;

  void _addTask() {
    //La collection des taches de l'utilisateur connecté.
    CollectionReference<Task> taskCollection = database.collection("users").doc(currentUser!.uid).collection("Tasks").withConverter(
      fromFirestore: (doc, _) => Task.fromJson(doc.data()!),
      toFirestore: (task, _)=> task.toJson(),);

    //Créer la tache à ajouter.
    Task task = new Task(1, "Test2", 0, 2, DateTime.now(), DateTime.now());
    //Ajouter la tache à la liste des taches de l'utilisateur.
    taskCollection.add(task);
    setState(() {});
  }
  void _getList() async
  {
    //Get la liste des users.
    CollectionReference<Person> personnes = await collectionRef.withConverter(
        fromFirestore: (snapshot, _) => Person.fromJson(snapshot.data()!),
        toFirestore: (Person, _)=> Person.toJson());

    //Get la liste des tasks du user connecté.
    CollectionReference<Task> taches = await personnes.doc(currentUser?.uid).collection("Tasks").withConverter(
        fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!),
        toFirestore: (Task, _)=> Task.toJson());

    CollectionReference<Task> test = database.collection("users").doc(currentUser?.uid).collection("Tasks").withConverter<Task>(
        fromFirestore: (doc, _) => Task.fromJson(doc.data()!),
        toFirestore: (task, _)=> task.toJson(),);

  QuerySnapshot<Task> truc = await test.get();
    listeItem = truc.docs;
    print(listeItem.toString() + "ALKAOALOALOA");
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
    _getList();
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
            MaterialButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                setState(() {});
              },
              child: Text("signout " + (FirebaseAuth.instance.currentUser!.displayName != null?FirebaseAuth.instance.currentUser!.displayName.toString():"") ),
            ),
            TextButton(onPressed: (){_getList();}, child: Text("Refresh")),
            Flexible(child:
            ListView(
              children:
              (listeItem!=null)?
                  //NOTE: Vu que le taskDoc n'est pas dynamique, si il y a un item dans firebase
                  //qui n'est pas convertissable en Task, l'app crash.
              listeItem.map<Widget>( (QueryDocumentSnapshot<Task> taskDoc) => ListTile(
                  title: Text(taskDoc.data()!.name))).toList()
                  :[ListTile(title: Text("Loading"))].toList(),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: '_testFireBase',
        child: const Icon(Icons.add),
      ),
    );
  }
}
