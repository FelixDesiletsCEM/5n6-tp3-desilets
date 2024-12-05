import 'dart:ffi';

//@JsonSerializable()
class HomeItemResponse
{
  HomeItemResponse (this.id, this.name, this.percentageDone, this.percentageTimeSpent,/*this.creationDate,*/ this.deadline);
  int id;
  //DateTime creationDate;
  DateTime deadline;
  int percentageDone;
  double percentageTimeSpent;
  String name;

  //factory HomeItemResponse.fromJson(Map<String, dynamic> json) => _$HomeItemResponseFromJson(json);

  //Map<String, dynamic> toJson() => _$HomeItemResponseToJson(this);
}