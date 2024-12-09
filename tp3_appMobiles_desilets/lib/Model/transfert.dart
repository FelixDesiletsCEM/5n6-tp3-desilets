import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'transfert.g.dart';

@JsonSerializable()
class Task
{
  Task (this.name, this.percentageDone, this.percentageTimeSpent,this.creationDate, this.deadline);
  int id = 0;
  String name = "";
  DateTime creationDate = DateTime.utc(0,0,0,0,0,0);
  DateTime deadline = DateTime.utc(0,0,0,0,0,0);
  int percentageDone = 0;
  double percentageTimeSpent = 0;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
@JsonSerializable()
class Person
{
  Person(this.name, this.password, this.email);
  int id = 0;
  String name = "";
  String password = "";
  String email = "";
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}