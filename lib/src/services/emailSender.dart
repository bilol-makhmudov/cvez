import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../models/Email.dart';

Future<void> emailSender(Email emailToSend) async {
  final smtpServer =
      gmail(emailToSend.senderEmail!, emailToSend.senderPassword!);

  final message = Message()
    ..from = Address(emailToSend.senderEmail!, 'cv_ez')
    ..recipients.add(emailToSend.receiver!)
    ..subject = emailToSend.subject!
    ..text = emailToSend.isHTML! ? null : emailToSend.body
    ..html = emailToSend.isHTML! ? emailToSend.body : null;

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: $sendReport');
  } on MailerException catch (e) {
    print('Message not sent.');
    e.problems.forEach((p) => print('Problem: ${p.code}: ${p.msg}'));
  } catch (e) {
    print(e);
    print("not sent");
  }
}
