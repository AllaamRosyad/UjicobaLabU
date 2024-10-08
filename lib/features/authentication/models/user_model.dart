// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:t_store/utils/formatters/formatter.dart';

// /// Model class representing user data
// class UserModel {
//   // Keep those values final which you do not want to update
//   final String id;
//   String firstName;
//   String lastName;
//   final String username;
//   final String email;
//   String phoneNumber;
//   String profilePicture;

//   /// Constructor for UserModel
//   UserModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.username,
//     required this.email,
//     required this.phoneNumber,
//     required this.profilePicture,
//   });

//   /// Helper function to get the full name.
//   String get fullName => '$firstName $lastName';

//   /// Helper funtion to format phone number.
//   String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

//   /// Static function to split full name into first and last name.
//   static List<String> nameParts(fullName) => fullName.split(" ");

//   /// Static funtion to generate a username from the full name.
//   static String generateUsername(fullName) {
//     List<String> nameParts = fullName.split(" ");
//     String firstName = nameParts[0].toLowerCase();
//     String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

//     /// Combine first and last name
//     String camelCaseUsername = '$firstName$lastName';

//     /// Add "cwt_" prefix
//     String usernameWithPrefix = 'cwt_$camelCaseUsername';

//     return usernameWithPrefix;
//   }

//   /// Static function to create on empty user model.
//   static UserModel empty() => UserModel(
//       id: '',
//       firstName: '',
//       lastName: '',
//       username: '',
//       email: '',
//       phoneNumber: '',
//       profilePicture: '');

//   /// Conver model to JSON structure for staring data in Firebase.
//   Map<String, dynamic> toJson() {
//     return {
//       'FirstName': firstName,
//       'LastName': lastName,
//       'Username': username,
//       'Email': email,
//       'PhoneNumber': phoneNumber,
//       'ProfilePicture': profilePicture,
//     };
//   }

//   /// Factory method to create a UserModel from a Firebase document snapshot.
//   factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data()!;
//       return UserModel(
//           id: document.id,
//           firstName: data['firstName'] ?? '',
//           lastName: data['lastName'] ?? '',
//           username: data['username'] ?? '',
//           email: data['email'] ?? '',
//           phoneNumber: data['phoneNumber'] ?? '',
//           profilePicture: data['profilePicture'] ?? '');
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';

/// Model class representing user data
class UserModel {
  // Keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper funtion to format phone number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static funtion to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    /// Combine first and last name
    String camelCaseUsername = '$firstName$lastName';

    /// Add "cwt_" prefix
    String usernameWithPrefix = 'cwt_$camelCaseUsername';

    return usernameWithPrefix;
  }

  /// Static function to create on empty user model.
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  /// Conver model to JSON structure for staring data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      // Return an empty user model if the document data is null
      return UserModel.empty();
    }
  }
}
