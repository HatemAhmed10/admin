import 'package:admin/shared/components/1Tooles/4CustomshowToast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/models/1News_Model/News_Model.dart';
import 'News_State.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// To upload Image To Firebase
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class News_Cubit extends Cubit<News_States> {
  News_Cubit() : super(NewsTypeInitialState());

  static News_Cubit get(context) => BlocProvider.of(context);

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? photo;
  final ImagePicker _picker = ImagePicker();
  var FinaUrl = "";

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      print(photo);
      showToast(text: photo.toString(), state: ToastStates.SUCCESS);
      // uploadFile();
    } else {
      print('No image selected.');
    }

    emit(UploadImageState());
  }

  Future uploadFile({
    required String text,
  }) async {
    emit(UploadImageLoadingState());

    if (photo == null) return;
    final fileName = basename(photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(photo!);
      FinaUrl = (await ref.getDownloadURL()).toString();
      UploadNews(text: text, imageUrl: FinaUrl);
      emit(UploadImageState());
    } catch (e) {
      print('error occured');
    }
  }

  void ShowPicker(
    context,
    String text,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                // ListTile(
                //   leading: const Icon(Icons.photo_camera),
                //   title: const Text('Camera'),
                //   onTap: () {
                //     imgFromCamera();
                //     Navigator.of(context).pop();
                //   },
                // ),
              ],
            ),
          );
        });
  }

  //______________________________________________________
  void UploadNews({
    required String text,
    required String imageUrl,
  }) {
    emit(SendUserInformationLoadingSuccessState());

    // DateTime now = DateTime.now();
    // var formatterDate = DateFormat('dd/MM/yy');
    // String actualDate = formatterDate.format(now);
    // Postdate.text = actualDate.toString();
    Timestamp nowDate = Timestamp.now();

    var Id = FirebaseFirestore.instance
        .collection('DataBase')
        .doc('Table')
        .collection('Users')
        .doc();

    NewsModel model = NewsModel(
      id: Id.id,
      Text: text,
      imageurl: imageUrl,
      date: nowDate,
    );

    FirebaseFirestore.instance
        .collection('DataBase')
        .doc("Table")
        .collection("News")
        .doc(Id.id)
        .set(model.toMap())
        .then((value) {
      emit(SendUserInformationSuccessState());
    }).catchError((error) {
      emit(SendUserInformationErrorState());
    });
  }
}
