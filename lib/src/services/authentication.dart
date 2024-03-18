import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/Auth/User.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> signUpUser(UserModel userData) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email!.trim(),
        password: userData.password!.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {

        User? user = FirebaseAuth.instance.currentUser;
        user?.updateDisplayName(userData.displayName);

        UserModel userModel = UserModel(
          userId: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: userData.displayName ?? '',
        );

        registerUserRTDB(userModel);
        return userModel;
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<UserModel?> registerUserRTDB(UserModel userModel) async {
    try{
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref("Users");
      await databaseReference.child(userModel.userId!).set(userModel.toJson());
      return userModel;
    } on FirebaseException catch (e){
      print(e.toString());
    }
    return null;
  }

  Future<UserModel?> signInUser(UserModel userModel) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: userModel.email!.trim(),
        password: userModel.password!.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
          userId: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '',
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
