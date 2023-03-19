import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/1Type/2Learn_Model/1Photo_Model.dart';
import '../../../../../data/models/1Type/4Choose-Subject/SubjectModel.dart';
import '../../../../1Choose_Type/Choose_Type_Cubit.dart';
import 'Add_Photo_State.dart';
import 'package:admin/shared/components/1Tooles/4CustomshowToast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Add_Photo_Cubit extends Cubit<Add_Photo_States> {
  Add_Photo_Cubit() : super(Add_Photot_InitialState());

  static Add_Photo_Cubit get(context) => BlocProvider.of(context);

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

  Future uploadFile2({
    required String Text,
    required String titleSubject,
    required String subTitleSubject,
    required int numberOfImage,
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
      UploadPhtoLearn(
        imageUrl: FinaUrl,
        Text: Text,
        videourl: "",
        pdfurl: "",
        titleSubject: titleSubject,
        subTitleSubject: subTitleSubject,
        numberOfImage: numberOfImage,
      );
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

//_____________________________________________________________

  void UploadPhtoLearn({
    required String Text,
    required String imageUrl,
    required String videourl,
    required String pdfurl,
    required String titleSubject,
    required String subTitleSubject,
    required int numberOfImage,
  }) {
    emit(UploadPhtoLearnLoadingSuccessState());

    // DateTime now = DateTime.now();
    // var formatterDate = DateFormat('dd/MM/yy');
    // String actualDate = formatterDate.format(now);
    // Postdate.text = actualDate.toString();
    Timestamp nowDate = Timestamp.now();

    var FId = FirebaseFirestore.instance.collection('Learn').doc();

    LearnModel model = LearnModel(
      id: FId.id,
      text: Text,
      imageurl: FinaUrl,
      videourl: videourl,
      pdfurl: pdfurl,
      titleSubject: titleSubject,
      subTitleSubject: subTitleSubject,
      numberOfImage: numberOfImage,
      date: nowDate,
    );

    // SubjectModel subjectModel = SubjectModel(
    //     title: titleSubject, subTitle: subTitleSubject, color: numberOfImage);

    // FirebaseFirestore.instance
    //     .collection("Subject")
    //     .doc(FId.id)
    //     .set(subjectModel.toMap())
    //     .then((value) {
    //   emit(AddSubjectSuccessState());
    // }).catchError((error) {
    //   emit(AddSubjectErrorState());
    // });

    FirebaseFirestore.instance
        .collection("Learn")
        .doc(FId.id)
        .set(model.toMap())
        .then((value) {
      emit(UploadPhtoLearnSuccessState());
    }).catchError((error) {
      emit(UploadPhtoLearnErrorState());
    });
  }
}
