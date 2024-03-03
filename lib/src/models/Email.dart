class Email {
  String? senderEmail;
  String? senderPassword;
  String? receiver;
  String? subject;
  String? body;
  bool? isHTML;

  Email(
      {this.senderEmail,
      this.senderPassword,
      this.receiver,
      this.subject,
      this.body,
      this.isHTML});
}
