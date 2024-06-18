import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/models/user_model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // instance from firebase store database
  final _db = FirebaseFirestore.instance;

  // save user data to firebase
  Future<void> saveUserDataToFirebase(UserModel user) async {
    try {
// open a new collection called users and
//then a document with the user id
// and set the user data in the form of json <  map  > because we are using firebase and needs json
      await _db.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: 'cloud_firestore', code: e.code, message: e.message);
    }
  }
}
