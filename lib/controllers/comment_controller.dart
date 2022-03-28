import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant/constant.dart';
import 'package:tiktok_clone/models/comments/comment_model.dart';

class CommentController extends GetxController {
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get comments => _comments.value;
  String _postId = "";

  updatePostId(String id) {
    _postId = id;
    getComment();
  }

  getComment() async {
    _comments.bindStream(firestore
        .collection("videos")
        .doc(_postId)
        .collection("comments")
        .snapshots()
        .map((QuerySnapshot query) {
      List<Comment> returnValue = [];
      for (var element in query.docs) {
        returnValue.add(Comment.fromSnap(element));
      }
      return returnValue;
    }));
  }

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        DocumentSnapshot userDoc = await firestore
            .collection('user')
            .doc(authController.user.uid)
            .get();
        var allDocs = await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .get();
        int len = allDocs.docs.length;

        Comment comment = Comment(
          username: (userDoc.data()! as dynamic)['name'],
          comment: commentText.trim(),
          datePublished: DateTime.now(),
          likes: [],
          profilePhoto: (userDoc.data()! as dynamic)['profilePhoto'],
          uid: authController.user.uid,
          id: 'Comment_$len',
        );
        await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .doc('Comment_$len')
            .set(
              comment.toJson(),
            );

        await firestore.collection('videos').doc(_postId).update({
          'commentCount': 0 + len,
        });
      }
    } catch (e) {
      Get.snackbar(
        'Error While Commenting',
        e.toString(),
      );
    }
  }

  likeComment(String id) async {
    final uid = authController.user.uid;
    DocumentSnapshot doc = await firestore
        .collection("videos")
        .doc(_postId)
        .collection("comments")
        .doc(id)
        .get();
    if ((doc.data() as dynamic)['likes'].contains(uid)) {
      await firestore
          .collection("videos")
          .doc(_postId)
          .collection("comments")
          .doc(id)
          .update({
        "likes": FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore
          .collection("videos")
          .doc(_postId)
          .collection("comments")
          .doc(id)
          .update({
        "likes": FieldValue.arrayUnion([uid]),
      });
    }
  }
}
