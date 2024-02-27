import 'package:uuid/uuid.dart';

class Skill {
  String id;
  String name;
  String level;
  String note;

  Skill({
    String? id,
    required this.name,
    required this.level,
    required this.note,
  }) : id = id ?? Uuid().v4();
}
