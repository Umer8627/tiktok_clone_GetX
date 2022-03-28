import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant/constant.dart';
import 'package:tiktok_clone/controllers/comment_controller.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({Key? key, required this.id}) : super(key: key);

  final _commentController = TextEditingController();

  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: commentController.comments.length,
                    itemBuilder: (context, index) {
                      final comment = commentController.comments[index];
                      print(comment.profilePhoto);
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            comment.profilePhoto,
                          ),
                        ),
                        title: Row(children: [
                          Text(
                            comment.username,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              comment.comment,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ]),
                        subtitle: Row(children: [
                          Text(
                            tago.format(comment.datePublished.toDate()),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${comment.likes.length} likes",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ]),
                        trailing: InkWell(
                          onTap: () =>
                              commentController.likeComment(comment.id),
                          child: Icon(
                            Icons.favorite,
                            color:
                                comment.likes.contains(authController.user.uid)
                                    ? Colors.red
                                    : Colors.white,
                            size: 30,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Comment",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    commentController.postComment(_commentController.text);
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
