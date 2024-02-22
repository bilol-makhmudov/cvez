import 'package:uuid/uuid.dart';

class Education {
  String id;
  String title;
  String major;
  String description;
  DateTime? startDate;
  DateTime? endDate;
  bool? stillStudying;

  Education(
      {String? id,
      required this.title,
      required this.major,
      required this.description,
      this.startDate,
      this.endDate,
      this.stillStudying})
      : id = id ?? Uuid().v4();
}
