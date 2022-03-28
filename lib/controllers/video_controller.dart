import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../models/video_model/video_model.dart';

class VideoController extends GetxController {
  static VideoController instance = Get.find();
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        firestore.collection("videos").snapshots().map((QuerySnapshot query) {
      List<Video> returnValue = [];
      for (var element in query.docs) {
        returnValue.add(Video.fromSnap(element));
      }
      return returnValue;
    }));
  }

  likeVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }
}
  

/*getCurrentUser() async {
    var username =
        (await firebaseFirestore.collection("users").doc(widget.docId).get());
    setState(() {
      name = username;
    });
  }*/
/* */


/*  likeVideo(String id) async {
    try {
      final DocumentSnapshot result =
          await FirebaseFirestore.instance.collection("videos").doc(id).get();
      print(result.exists);

      // print("This is id from video screen" + id);
      // print(authController.user.uid);
      // final documentSnapshot = (await FirebaseFirestore.instance
      //         .collection("videos")
      //         .doc("Video 0")
      //         .get())
      //     .get("username")
      //     .data()?["username"];

      // print(documentSnapshot);
      // Map<String, dynamic> _docdata = doc.data() as Map<String, dynamic>;
      // Video video = Video.fromSnap(doc);
      // print(video.id);

      // final id2 = doc["id"];
      // print("this is $id2");
      // print(doc.data()[]);
      // print(doc.get('likes'));
      // var uid = authController.user.uid;
      // print(doc.id);
      // print((doc.data() as dynamic)["id"].toString());
      //     if (doc.exists) {
      //    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      //   var value = data?['id']; // <-- The value you want to retrieve.
      //    print(value);
      // }
        if ((result.data() as dynamic)["likes"].contains()) {
          await firestore.collection("videos").doc(id).update({
            'likes': FieldValue.arrayUnion([uid]),
          });
        } else {
          await firestore.collection("videos").doc(id).update({
            "likes": FieldValue.arrayRemove([uid]),
          });
        }
      }
    } catch (e) {
      print("this is error =>>>>>>>>>>>>>>>>>>>>$e");
    }*/ 