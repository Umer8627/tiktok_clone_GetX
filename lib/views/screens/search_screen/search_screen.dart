import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/search_controller.dart';
import 'package:tiktok_clone/views/screens/profile_screen/profile_screen.dart';

import '../../../models/user_model/user_model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            onFieldSubmitted: (value) => searchController.searchUser(value),
            decoration: InputDecoration(
                filled: false,
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
          ),
        ),
        body: searchController.searchUsers.isEmpty
            ? Center(
                child: Text("Search for users",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )))
            : ListView.builder(
                itemCount: searchController.searchUsers.length,
                itemBuilder: ((context, index) {
                  User user = searchController.searchUsers[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfileScreen(uid: user.uuid)));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePhoto),
                      ),
                      title: Text(
                        user.name,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  );
                })),
      );
    });
  }
}
