import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Model/transfert.dart';
import 'generated/l10n.dart';


User? currentUser = FirebaseAuth.instance.currentUser;

CollectionReference<Person> collectionUsers = FirebaseFirestore
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
void addUser() {
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
    //Rethrow pour pouvoir afficher le message dans l'app.
    rethrow;
  }
}

void editTask(QueryDocumentSnapshot<Task> pTask, int pValue) {
  try
  {
    if(_taskIsValid(pTask.data()))
    {
      DocumentReference<Task> taskDoc = repoOfCurrentUser.doc(pTask.id);
      Task nouvelleTask = pTask.data(); //Créer une copie de la task à modifier.
      nouvelleTask.percentageDone = pValue;//Change le % de complétion.
      taskDoc.set(nouvelleTask);//Change la task sur firestore pour la copie modifiée.
    }
  }
  catch(e){
    //Rethrow pour pouvoir afficher le message dans l'app.
    rethrow;
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
  if(pTask.deadline.isBefore(DateTime.now()))//La deadline est dans le futur.
      {
    throw new Exception(S.current.TaskErrorDeadlineAlreadyPassed);
    return false;
  }
  return true;
}

int calculPourcentage(DateTime debut, DateTime fin){
  Duration dureeTotal = fin.difference(debut);
  Duration tempsEcoule = DateTime.now().difference(debut);

  double pourcentage = ((tempsEcoule.inSeconds / dureeTotal.inSeconds) * 100);
  return pourcentage.round();
}