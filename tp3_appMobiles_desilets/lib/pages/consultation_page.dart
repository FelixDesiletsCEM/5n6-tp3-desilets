import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tp3_appmobiles_desilets/tiroir_nav.dart';
import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/Model/transfert.dart';
import '../generated/l10n.dart';
import '../main.dart';
import '../service.dart';
import 'accueil_page.dart';
class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key, required this.task});

  final Task task;
  @override
  State<ConsultationPage> createState() => _ConsultationPage();
}



class _ConsultationPage extends State<ConsultationPage> with WidgetsBindingObserver {
  final pourcentageTextController = TextEditingController();
  //final picker = ImagePicker();
  bool loading = false;

  @override
  void initState() {
    super.initState();
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
            /*Expanded(child: CachedNetworkImage(
              imageUrl: "http://10.0.2.2:8080/file/${widget.task.}" ,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),*/
            Expanded(child:
            OutlinedButton(onPressed: loading? null: ()async {
              loading = true;
              //TODO Charger l'image
              loading = false;}, child: Text(S.of(context).pageConsultationChangerImage)),
            ),
            Expanded(child:
            Text("${S.of(context).pageConsultationNomTache} ${widget.task.name}"),
            ),
            Expanded(child:
            Text("${S.of(context).pageConsultationPourcentageCompletion} ${widget.task.percentageDone}"),
            ),
            Expanded(child:
            Text("${S.of(context).pageConsultationPourcentageTemps} ${widget.task.percentageTimeSpent}"),
            ),
            Expanded(child:
            TextField(
                controller: pourcentageTextController,
                decoration: InputDecoration(hintText: S.of(context).pageConsultationNouvelleValeur)
            ),
            ),
            Expanded(child:
            OutlinedButton(onPressed: loading? null: ()async{
              loading = true;
              //TODO Changer la tache.
              loading = false;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccueilPage(),
                ),
              );
            }, child: Text("S.of(context).pageConsultationModifier")),
            ),
            Expanded(child:
            OutlinedButton(onPressed: loading? null: (){}, child: Text("S.of(context).SuppressionTache")))
          ],
        ),
      ),
    );
  }
}