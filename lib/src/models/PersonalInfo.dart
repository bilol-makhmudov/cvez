class PersonalInfo {
  String firstName;
  String lastName;
  String jobTitle;
  String email;
  String phoneNumber;
  String website;
  String linkedIn;
  String instagram;
  String twitter;
  String addressFirstLine;
  String addressSecondLine;
  String summary;
  String? personalPhoto;

  PersonalInfo({
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.email,
    required this.phoneNumber,
    required this.website,
    required this.linkedIn,
    required this.instagram,
    required this.twitter,
    required this.addressFirstLine,
    required this.addressSecondLine,
    required this.summary,
    this.personalPhoto,
  });
}
