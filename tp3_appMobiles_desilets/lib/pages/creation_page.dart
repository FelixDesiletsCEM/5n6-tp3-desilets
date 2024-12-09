import 'package:flutter/material.dart';
import 'package:tp3_appmobiles_desilets/tiroir_nav.dart';
import '../Model/transfert.dart';
import '../generated/l10n.dart';
import '../service.dart';
import 'accueil_page.dart';
import 'package:flutter/services.dart';

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
                    icon: Icon(Icons.calendar_today), //icon of text field
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
                  //TODO LES IDS SONT PAS PK!
                  loading = true;
                  try{
                    Task task = Task(3,
                        tasknameTextController.text,
                        0,
                        0,
                        DateTime.now(),
                        deadline);
                    /*task.name = tasknameTextController.text;
                    task.percentageDone = 0;
                    task.percentageTimeSpent =  0;
                    task.creationDate = DateTime.now();
                    task.deadline = DateTime.parse(dateController.text);*/
                    addTask(task);

                  }
                  catch(e){
                    print(e);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccueilPage(),
                    ),
                  );
                  loading = false;},
                child: Text(S.of(context).pageCreationAjoutTache)
            )
          ],
        ),
      ),
    );
  }
}