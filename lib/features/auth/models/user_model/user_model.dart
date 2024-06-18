import 'package:store/utils/formatter/formatter.dart';

class UserModel {
// only make the unchanged variables final 

  final String id;
   String firstName;
   String lastName;
  final String username;
  final String email;
   String phoneNumber; 
   String profilePicture; 

   UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
   required this.profilePicture,
  });


// Helper function to get the full name of the user 
String get fullName => '$firstName $lastName';

// Helper function to format the phone number 
String get formattedPhoneNumber => CFormatter.formatPhoneNumber(phoneNumber);


// static function to split full name into first name and last name

static List<String> nameSplitter(String fullName) => fullName.split(' ');


/// static function to generate a username from the full name
/// 
  static String generateUsername(String fullName){

     List<String> nameParts = nameSplitter(fullName);
     String firstName = nameParts[0];
     String lastName =   nameParts.length > 1 ? nameParts[1] : '';

     return firstName + lastName;
  }




// Helper function to create an empty user model 
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber: '',
    profilePicture: '',
  );


// convert the model to json 
  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'username': username,
    'email': email,
    'phoneNumber': phoneNumber,
    'profilePicture': profilePicture,
  };

}
