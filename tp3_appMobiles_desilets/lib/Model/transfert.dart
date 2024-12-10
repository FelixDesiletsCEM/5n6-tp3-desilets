import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfert.g.dart';

@JsonSerializable()
class Task
{
  Task (this.name, this.percentageDone, this.creationDate, this.deadline) {
    percentageTimeSpent = _calculPourcentage(creationDate, deadline) * 1.0;
  }
  String id = "";
  String name = "";
  DateTime creationDate = DateTime.utc(0,0,0,0,0,0);
  DateTime deadline = DateTime.utc(0,0,0,0,0,0);
  int percentageDone = 0;
  double percentageTimeSpent = 0;
  String imageUrl = "https://qtnjlvjljrnkebcwpvfi.supabase.co/storage/v1/object/public/supabucket/default.jpg?t=2024-12-10T21%3A20%3A15.832Z";

  factory Task.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Task t = _$TaskFromJson(doc.data()!);
    t.id = doc.id;
    return t;
  }
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  int _calculPourcentage(DateTime debut, DateTime fin){
    Duration dureeTotal = fin.difference(debut);
    Duration tempsEcoule = DateTime.now().difference(debut);
    double pourcentage = 1;

    if(dureeTotal.inSeconds != 0)
    {
      pourcentage = ((tempsEcoule.inSeconds / dureeTotal.inSeconds) * 100);
    }

    return pourcentage.round();
  }

}
@JsonSerializable()
class Person
{
  Person(this.name, this.password, this.email);
  String id = "";
  String name = "";
  String password = "";
  String email = "";
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}