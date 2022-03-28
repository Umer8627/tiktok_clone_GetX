import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controllers/video_controller.dart';
import 'package:tiktok_clone/views/screens/add_video/add_video_screen.dart';
import 'package:tiktok_clone/views/screens/displaying_video/display_video.dart';
import 'package:tiktok_clone/views/screens/profile_screen/profile_screen.dart';
import 'package:tiktok_clone/views/screens/search_screen/search_screen.dart';

import '../controllers/auth_controller.dart';

const backgroundColor = Colors.black;
var buttonColor = Colors.red.shade400;
const borderColor = Colors.grey;

// Firebase

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// Controllers

var authController = AuthController.instance;
var videoController = VideoController.instance;
// Constant Pages

List pages = [
  VideoScreen(),
  SearchScreen(),
  AddVideoScreen(),
  Text("Message Screen"),
  ProfileScreen(uid: authController.user.uid),
];
