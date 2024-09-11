import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

// instance of the database
  final db = FirebaseFirestore.instance;
  final currentUserId = AuthenticationRepository.instance.currentAuthUser!.uid;
// fetch use addresses
  Future<List<AddressModel>> getUserAddresses() async {
    try {
     

      if (currentUserId.isEmpty) {
        throw 'Unable to find the user information , try again in a few minutes.';
      }
      // get the user addresses from the database
      // get the addresses collection [ sub collection ] from the users collection [ main collection ]
      // of the current user [ userId ]
      final snapshot = await db
          .collection('users')
          .doc(currentUserId)
          .collection('addresses')
          .get();
      final addresses = snapshot.docs
          .map((document) => AddressModel.fromSnapshot(document))
          .toList();
      return addresses;
    } catch (e) {
      throw 'Something went wrong while fetching address information , try again later. ';
    }
  }


  // add new address
  // the add method in the firebase collection  takes the address and save it
  // and returns the id of the address that has been added.
  Future<String> addNewAddress(AddressModel address) async {
    try {
      // add method returns a document  
      final savedAddress = await db
          .collection('users')
          .doc(currentUserId)
          .collection('addresses')
          .add(address.toJson());
// after adding the address return its id
      return savedAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving address information , try again later. ';
    }
  }

// update selected field in the firebase database
// By taking the address id and the selected field [ true or false ]
  Future<void> updateIsSelectedField(String addressId, bool isSelected) async {
    try {
      // get the use id from the authentication

      if (currentUserId.isEmpty) {
        throw 'Unable to find the user information , try again in a few minutes.';
      }
      // get the user addresses from the database
      // get the addresses collection [ sub collection ] from the users collection [ main collection ]
      // of the current user [ userId ]
      await db
          .collection('users')
          .doc(currentUserId)
          .collection('addresses')
          .doc(addressId)
          .update({'isSelected': isSelected});
    } catch (e) {
      throw 'Something went wrong while fetching address information , try again later. ';
    }
  }


// delete address from the database
  Future<void> deleteAddress(String addressId) async {
    try {
      // get the use id from the authentication
      if (currentUserId.isEmpty) {
        throw 'Unable to find the user information , try again in a few minutes.';
      }
      // get the user addresses from the database
      // get the addresses collection [ sub collection ] from the users collection [ main collection ]
      // of the current user [ userId ]
      await db
          .collection('users')
          .doc(currentUserId)
          .collection('addresses')
          .doc(addressId)
          .delete();
    } catch (e) {
      throw 'Something went wrong while fetching address information , try again later. ';
    }
  }


}
