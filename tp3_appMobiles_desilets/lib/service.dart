import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Model/transfert.dart';
final collectionRef = FirebaseFirestore
    .instance
    .collection("users");

//TODO S'arranger pour que currentUser devienne un User plutôt qu'un ?User. Ce serait moins chiant.
User? currentUser = FirebaseAuth.instance.currentUser;

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

void addTask(Task pTask) {
  if(_taskIsValid(pTask))
  {
    //La collection des taches de l'utilisateur connecté.
    CollectionReference<Task> taskCollection = FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).collection("Tasks").withConverter(
      fromFirestore: (doc, _) => Task.fromJson(doc.data()!),
      toFirestore: (task, _)=> task.toJson(),);

    //Créer la tache à ajouter.
    //Task task = new Task(1, "Test2", 0, 2, DateTime.now(), DateTime.now());
    //Ajoute la tache à la liste des taches de l'utilisateur.

    taskCollection.add(pTask);
  }
  else{
    //TODO afficher un message d'erreur.
  }
}
void editTask(Task pTask) {
  if(_taskIsValid(pTask))
  {
    //La collection des taches de l'utilisateur connecté.
    CollectionReference<Task> taskCollection = FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).collection("Tasks").withConverter(
      fromFirestore: (doc, _) => Task.fromJson(doc.data()!),
      toFirestore: (task, _)=> task.toJson(),);

    //Changer la tache à la liste des taches de l'utilisateur.
    DocumentReference<Task> taskDoc = taskCollection.doc(pTask.name);//TODO marche pas, faut le id.
    taskDoc.set(pTask);
    //taskCollection.add(pTask);
  }
  else{
    //TODO afficher un message d'erreur.
  }
}
bool _taskIsValid (Task pTask)
{
  if(pTask.name.trim() == "")//Le nom n'est pas vide.
      {
    return false;
  }
  if(false)//Vérifier qu'il n'y a pas une tache avec le même nom.
      {
    return false;
  }
  if(pTask.deadline.compareTo(DateTime.now()) > 0)//La deadline est dans le futur.
      {
    return false;
  }
  return true;
}