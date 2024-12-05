import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'transfert.g.dart';

@JsonSerializable()
class Task
{
  Task (this.id, this.name, this.percentageDone, this.percentageTimeSpent,this.creationDate, this.deadline);
  int id;
  String name;
  DateTime creationDate;
  DateTime deadline;
  int percentageDone;
  double percentageTimeSpent;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
@JsonSerializable()
class Person
{
  Person();
  int id = 0;
  String name = "";
  String email = "";
  String password = "";
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}