import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tp3_appmobiles_desilets/service.dart';
import 'package:tp3_appmobiles_desilets/tiroir_nav.dart';
import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/Model/transfert.dart' as tache;
import '../generated/l10n.dart';
import 'accueil_page.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key, required this.task});

  final QueryDocumentSnapshot<tache.Task> task;
  @override
  State<ConsultationPage> createState() => _ConsultationPage();
}

class _ConsultationPage extends State<ConsultationPage> with WidgetsBindingObserver {
  final pourcentageTextController = TextEditingController();
  bool isLoading = false;
  final picker = ImagePicker();
  var _imageFile;
  var _publicUrl;

   sendPicture(XFile xfile) async {
    final supabase = Supabase.instance.client;

    String bucketid = "supabucket";
    /*try {
      await supabase
          .storage
          .createBucket(bucketid, BucketOptions(public: true));
    } on StorageException catch(e) {
      if(e.error == "Duplicate") {
        // Le bucket existe déjà
        print(e);
      }
    }*/

    try
    {
      final String fullPath = await supabase
          .storage
          .from(bucketid)
          .upload(
        //TODO Mettre un nom unique
          xfile.name,
          File(xfile.path)
      );
      print(fullPath);
    }
    catch(e){
      print(e);
    }

    _publicUrl = supabase
        .storage
        .from(bucketid)
        .getPublicUrl(xfile.name);


  }

  Future getImage() async {
    print("ouverture du selecteur d'image");
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print("l'image a ete choisie ${pickedFile.path}");
      _imageFile = File(pickedFile.path);
      setState(() {});

      await sendPicture(pickedFile);
      setState(() { });
    }
  }
  @override
  void initState() {
    super.initState();
    _publicUrl = widget.task.data().imageUrl;
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {});
    } else if (state == AppLifecycleState.paused) {
      //TODO Sauvegarder les infos? Pour le refresh.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageConsultationTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO Marche pas, il faut remplacer par l'url de l'image.
            Expanded(child: Image.network(_publicUrl)),
            //Expanded(child: Image.network(),
            Expanded(child:
            OutlinedButton(onPressed: isLoading? null: ()async {
              //loading = true;
              //TODO Changer image
              await getImage();
              isLoading = false;}, child: Text(S.of(context).pageConsultationChangerImage)),
            ),
            Expanded(child:
            Text("${S.of(context).pageConsultationNomTache} ${widget.task.data().name}"),
            ),
            Expanded(child:
            Text("${S.of(context).pageConsultationPourcentageCompletion} ${widget.task.data().percentageDone}"),
            ),
            Expanded(child://TODO truc date calcul %.
            Text("${S.of(context).pageConsultationPourcentageTemps} ${widget.task.data().percentageTimeSpent}"),
            ),
            Expanded(child:
            TextField(
                controller: pourcentageTextController,
                decoration: InputDecoration(hintText: S.of(context).pageConsultationNouvelleValeur)
            ),
            ),
            Expanded(child:
            OutlinedButton(onPressed: isLoading? null: ()async{
              isLoading = true;
              try
              {
                //Note: editTask ne prend pas une task mais un QueryDocumentSnapshot<Task>.

                editTask(widget.task, int.parse(pourcentageTextController.text!=""?pourcentageTextController.text:widget.task.data().percentageDone.toString()), _publicUrl);
              }
              catch(e){
                print(e);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
              isLoading = false;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccueilPage(),
                ),
              );
            }, child: Text(S.of(context).pageConsultationModifier)),
            ),
            Expanded(child:
            OutlinedButton(onPressed: isLoading? null: (){
            repoOfCurrentUser.doc(widget.task.id).delete();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccueilPage(),
              ),
            );
            }, child: Text(S.of(context).SuppressionTache))),
          ],
        ),
      ),
    );
  }
}