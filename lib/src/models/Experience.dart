class Experience {
  String company;
  String position;
  String location;
  String description;
  DateTime startDate;
  DateTime? finishDate;

  Experience({
    required this.company,
    required this.position,
    required this.location,
    required this.description,
    required this.startDate,
    this.finishDate,
  });
}
