import 'package:uuid/uuid.dart';

class Skill {
  String id;
  String name;
  int? level;
  String note;

  Skill({
    String? id,
    required this.name,
    this.level,
    required this.note,
  }) : id = id ?? Uuid().v4();
}
