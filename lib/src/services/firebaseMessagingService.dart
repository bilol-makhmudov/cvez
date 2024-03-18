import 'package:cv_ez/src/widgets/snackBar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {

    NotificationSettings settings = await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await _firebaseMessaging.getToken();
      //Its registering automatically to the server.
      print('Firebase Messaging token: $token');
    } else {
      showCustomSnackBar("You didn't give a permission!");
    }
  }
}
