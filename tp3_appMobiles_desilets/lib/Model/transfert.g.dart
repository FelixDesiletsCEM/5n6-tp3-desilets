// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      json['name'] as String,
      (json['percentageDone'] as num).toInt(),
      (json['percentageTimeSpent'] as num).toDouble(),
      DateTime.parse(json['creationDate'] as String),
      DateTime.parse(json['deadline'] as String),
    )..id = (json['id'] as num).toInt();

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creationDate': instance.creationDate.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      json['name'] as String,
      json['password'] as String,
      json['email'] as String,
    )..id = (json['id'] as num).toInt();

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'email': instance.email,
    };
