import 'package:get/get.dart';
import 'package:tiktok_clone/constant/constant.dart';
import 'package:tiktok_clone/models/user_model/user_model.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searchUsers = Rx<List<User>>([]);

  List<User> get searchUsers => _searchUsers.value;

  searchUser(String typeUser) async {
    _searchUsers.bindStream(firestore
        .collection("user")
        .where('name', isGreaterThanOrEqualTo: typeUser)
        .snapshots()
        .map((querySnapshot) {
      List<User> returnValue = [];
      for (var element in querySnapshot.docs) {
        returnValue.add(User.fromSnap(element));
      }
      return returnValue;
    }));
  }
}
