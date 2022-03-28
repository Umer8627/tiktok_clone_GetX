import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant/constant.dart';
import 'package:video_compress/video_compress.dart';

import '../models/video_model/video_model.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath) async {
    final compressVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);

    return compressVideo!.file;
  }

  _getThumnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child("videos").child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _uploadThumbnailImageToStorage(
      String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child("thumbnails").child(id);

    UploadTask uploadTask = ref.putFile(await _getThumnail(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // upload the video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDocs =
          await firestore.collection("user").doc(uid).get();
      // To get video id

      var allDocs = await firestore.collection("videos").get();
      int length = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $length", videoPath);
      String thumbnail =
          await _uploadThumbnailImageToStorage("Video $length", videoPath);

      Video video = Video(
        username: (userDocs.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video_$length",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        caption: caption,
        songname: songName,
        videoUrl: videoUrl,
        thumbnail: thumbnail,
        profilePhoto:
            (userDocs.data()! as Map<String, dynamic>)['profilePhoto'],
      );
      await firestore
          .collection("videos")
          .doc("Video_$length")
          .set(video.toJson());
      print("This is working");
      Get.back();
    } catch (e) {
      Get.snackbar("Error Uploading Video", e.toString());
    }
  }
}
