import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/tiroir_nav.dart';
import '../Model/transfert.dart';
import '../generated/l10n.dart';
import '../service.dart';
import 'accueil_page.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({super.key});
  @override
  State<CreationPage> createState() => _CreationPage();
}

class _CreationPage extends State<CreationPage> {
  final tasknameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final dateController = TextEditingController();
  bool loading = false;
  DateTime deadline = DateTime.utc(1, 1, 1, 1,1,1);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).pageCreationTitre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: tasknameTextController,
                decoration: InputDecoration(hintText: S.of(context).pageCreationNomTache)
            ),
            TextField(
                controller: dateController, //editing controller of this TextField
                decoration:  InputDecoration(
                    icon: const Icon(Icons.calendar_today), //icon of text field
                    labelText: deadline == DateTime.utc(1, 1, 1, 1,1,1)? S.of(context).pageCreationEntrerDate : deadline.toString() //label text of field
                ),
                readOnly: true,  // when true user cannot edit text
                onTap: () async {
                  //when click we have to show the datepicker
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  deadline = pickedDate!;
                  setState(() {});
                }
            ),
            OutlinedButton(
                onPressed: loading? null: () async {
                  loading = true;
                  try{
                    Task task = Task(
                        tasknameTextController.text,
                        0,
                        DateTime.now(),
                        deadline);
                    await FirestoreService.addTask(task);
                    //Redirige vers l'accueil si la création réussi.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccueilPage(),
                      ),
                    );
                  }
                  catch(e){
                    print(e);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                  loading = false;},
                child: Text(S.of(context).pageCreationAjoutTache)
            )
          ],
        ),
      ),
    );
  }
}