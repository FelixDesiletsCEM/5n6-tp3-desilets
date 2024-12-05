// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['percentageDone'] as num).toInt(),
      (json['percentageTimeSpent'] as num).toDouble(),
      DateTime.parse(json['creationDate'] as String),
      DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creationDate': instance.creationDate.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person()
  ..id = (json['id'] as num).toInt()
  ..name = json['name'] as String
  ..email = json['email'] as String
  ..password = json['password'] as String;

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
