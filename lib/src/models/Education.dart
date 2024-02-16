class Education {
  String title;
  String major;
  String description;
  DateTime startDate;
  DateTime? endDate;

  Education({
    required this.title,
    required this.major,
    required this.description,
    required this.startDate,
    this.endDate,
  });
}
