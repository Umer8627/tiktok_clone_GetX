import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uuid;
  User(
      {required this.email,
      required this.name,
      required this.profilePhoto,
      required this.uuid});

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uuid,
      };

  static User fromSnap(DocumentSnapshot snapshot) {
    var snapdata = snapshot.data() as Map<String, dynamic>;
    return User(
        email: snapdata["email"],
        name: snapdata["name"],
        profilePhoto: snapdata["profilePhoto"],
        uuid: snapdata["uid"]);
  }
}
