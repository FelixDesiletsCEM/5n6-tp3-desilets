import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
Future<void> addTask(Task pTask) async {
  try{
    if(await _taskIsValid(pTask))
    {
      //Ajouter la tache au repo de l'utilisateur connecté, si elle est valide.
      repoOfCurrentUser.add(pTask);
    }
  }
  catch(e){
    //Rethrow pour pouvoir afficher le message dans l'app.
    rethrow;
  }
}

Future<void> editTask(QueryDocumentSnapshot<Task> pTask, int pValue) async {
  try
  {
    //Fail forcément le 2e if. Peut-être changer plus tard.
    //if(await _taskIsValid(pTask.data()))
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

Future<bool> _taskIsValid (Task pTask)
async {
  if(pTask.name.trim() == "")//Le nom n'est pas vide.
      {
    throw Exception(S.current.TaskErrorNameEmpty);
    return false;
  }
  QuerySnapshot<Task> taches = await repoOfCurrentUser.get();
  if(taches.docs.where((t)=> t.data().name == pTask.name).isNotEmpty)//Vérifier qu'il n'y a pas une tache avec le même nom.
      {
    throw Exception(S.current.TaskErrorNameAlreadyUsed);
    return false;
  }
  if(pTask.deadline.isBefore(DateTime.now()))//La deadline est dans le futur.
      {
    throw Exception(S.current.TaskErrorDeadlineAlreadyPassed);
    return false;
  }
  return true;
}

int calculPourcentage(DateTime debut, DateTime fin){
  Duration dureeTotal = fin.difference(debut);
  Duration tempsEcoule = DateTime.now().difference(debut);
  double pourcentage = 1;

  if(dureeTotal.inSeconds != 0)
  {
    pourcentage = ((tempsEcoule.inSeconds / dureeTotal.inSeconds) * 100);
  }

  return pourcentage.round();
}