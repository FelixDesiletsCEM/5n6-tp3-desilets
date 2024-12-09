import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Model/transfert.dart';
import 'generated/l10n.dart';


User? currentUser = FirebaseAuth.instance.currentUser;

final collectionUsers = FirebaseFirestore
    .instance
    .collection("users").withConverter(
    fromFirestore: (snapshot, _) => Person.fromJson(snapshot.data()!),
    toFirestore: (Person, _)=> Person.toJson());

CollectionReference<Task> repoOfCurrentUser = collectionUsers.doc(currentUser?.uid).collection("Tasks").withConverter(
    fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!),
    toFirestore: (Task, _)=> Task.toJson());

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
  try{
    if(_taskIsValid(pTask))
    {
      //La collection des taches de l'utilisateur connecté.
      CollectionReference<Task> taskCollection = FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).collection("Tasks").withConverter(
        fromFirestore: (doc, _) => Task.fromJson(doc.data()!),
        toFirestore: (task, _)=> task.toJson(),);
      //Ajouter la tache au repo de l'utilisateur connecté, si elle est valide.
      taskCollection.add(pTask);
    }
  }
  catch(e){
    //TODO Afficher un message d'erreur dans l'app. Changer void par string, snackbar le résultat.
    print(e);
  }
}

void editTask(Task pTask) {
  try
  {
    if(_taskIsValid(pTask))
    {
      //La collection des taches de l'utilisateur connecté.
      CollectionReference<Task> taskCollection = FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).collection("Tasks").withConverter(
        fromFirestore: (doc, _) => Task.fromJson(doc.data()!),
        toFirestore: (task, _)=> task.toJson(),);

      //Changer la tache à la liste des taches de l'utilisateur.
      DocumentReference<Task> taskDoc = taskCollection.doc(pTask.name);//TODO marche pas, faut le id.
      taskDoc.set(pTask);
    }
  }
  catch(e){
    print(e);
  }
}

bool _taskIsValid (Task pTask)
{
  if(pTask.name.trim() == "")//Le nom n'est pas vide.
      {
    throw new Exception(S.current.TaskErrorNameEmpty);
    return false;
  }
  if(false)//Vérifier qu'il n'y a pas une tache avec le même nom.
      {
    throw new Exception(S.current.TaskErrorNameAlreadyUsed);
    return false;
  }
  if(pTask.deadline.compareTo(DateTime.now()) > 0)//La deadline est dans le futur.
      {
    throw new Exception(S.current.TaskErrorDeadlineAlreadyPassed);
    return false;
  }
  return true;
}