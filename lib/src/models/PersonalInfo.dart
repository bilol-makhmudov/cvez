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
    this.firstName = '',
    this.lastName = '',
    this.jobTitle = '',
    this.email = '',
    this.phoneNumber = '',
    this.website = '',
    this.linkedIn = '',
    this.instagram = '',
    this.twitter = '',
    this.addressFirstLine = '',
    this.addressSecondLine = '',
    this.summary = '',
    this.personalPhoto = '',
  });

  PersonalInfo copyWith({
    String? firstName,
    String? lastName,
    String? jobTitle,
    String? email,
    String? phoneNumber,
    String? website,
    String? linkedIn,
    String? instagram,
    String? twitter,
    String? addressFirstLine,
    String? addressSecondLine,
    String? summary,
    String? personalPhoto,
  }) {
    return PersonalInfo(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      jobTitle: jobTitle ?? this.jobTitle,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      website: website ?? this.website,
      linkedIn: linkedIn ?? this.linkedIn,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      addressFirstLine: addressFirstLine ?? this.addressFirstLine,
      addressSecondLine: addressSecondLine ?? this.addressSecondLine,
      summary: summary ?? this.summary,
      personalPhoto: personalPhoto ?? this.personalPhoto,
    );
  }
}
