import 'package:uuid/uuid.dart';

class Experience {
  String id;
  String company;
  String position;
  String? location;
  String? description;
  DateTime? startDate;
  DateTime? finishDate;
  bool? stillWorking;

  Experience(
      {String? id,
      required this.company,
      required this.position,
      this.location,
      this.description,
      this.startDate,
      this.finishDate,
      this.stillWorking})
      : id = id ?? Uuid().v4();
}
