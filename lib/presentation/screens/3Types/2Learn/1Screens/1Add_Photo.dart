import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/Types/1News_type/News_Cubit.dart';
import '../../../../../business_logic/Types/1News_type/News_State.dart';
import '../../../../../business_logic/Types/2Learn_Type/Screens/1Add_Photo/Add_Photo_Cubit.dart';
import '../../../../../business_logic/Types/2Learn_Type/Screens/1Add_Photo/Add_Photo_State.dart';
import '../../../../../shared/components/1Tooles/3CustomFormField.dart';
import 'package:admin/presentation/screens/2Choose_Type_Screen/Change_Type_Screen.dart';
import 'package:admin/shared/components/1Tooles/4CustomshowToast.dart';
import 'package:admin/shared/components/1Tooles/5Custom_Navigate.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Learn_Home.dart';

class AddPhoto_Screen extends StatefulWidget {
  const AddPhoto_Screen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.numberImage});

  final String title;
  final String subtitle;
  final int numberImage;

  @override
  State<AddPhoto_Screen> createState() => _AddPhoto_ScreenState(
      title: title, subtitle: subtitle, numberImage: numberImage);
}

class _AddPhoto_ScreenState extends State<AddPhoto_Screen> {
  _AddPhoto_ScreenState(
      {required this.title, required this.subtitle, required this.numberImage});
  final String title;
  final String subtitle;
  final int numberImage;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
    }
  }

  TextEditingController text = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Add_Photo_Cubit(),
      child: BlocBuilder<Add_Photo_Cubit, Add_Photo_States>(
        builder: (context, state) {
          Add_Photo_Cubit cubit = Add_Photo_Cubit.get(context);

          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! UploadPhtoLearnLoadingSuccessState,
              builder: (context) => SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Add Photo",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // cubit.ShowPicker(context, text.text);
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  key: formKey,
                                  child: CustomFormField(
                                    controller: text,
                                    type: TextInputType.text,
                                    Validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your email address';
                                      }
                                      return null;
                                    },
                                    validatorMassage: "Please Enter Text",
                                    cursorColor: Colors.black,
                                    hintText: "text",
                                    labelText: "Text",
                                    enabledBorder: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              cubit.photo != null
                                  // 5 > 2
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.file(
                                              cubit.photo!,
                                              fit: BoxFit.fitHeight,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        // child: Image(
                                        //     // width: 300,
                                        //     // height: 300,
                                        //     fit: BoxFit.fitHeight,
                                        //     image: AssetImage(
                                        //         ImageAssets.Admin_Image)),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (cubit.photo == null) {
                            cubit.UploadPhtoLearn(
                              Text: text.text,
                              imageUrl: "",
                              videourl: "",
                              pdfurl: "",
                              titleSubject: title,
                              subTitleSubject: subtitle,
                              numberOfImage: numberImage,
                            );
                            showToast(
                                text: "Success Add",
                                state: ToastStates.SUCCESS);
                            navigateBack(
                                context,
                                Learn_Home_Screen(
                                  title: title,
                                  subtitle: subtitle,
                                  numberImage: numberImage,
                                ));
                          } else {
                            cubit.uploadFile2(
                              Text: text.text,
                              titleSubject: title,
                              subTitleSubject: subtitle,
                              numberOfImage: numberImage,
                            );
                            cubit.UploadPhtoLearn(
                              Text: text.text,
                              imageUrl: "",
                              videourl: "",
                              pdfurl: "",
                              titleSubject: title,
                              subTitleSubject: subtitle,
                              numberOfImage: numberImage,
                            );
                            showToast(
                                text: "Success Add",
                                state: ToastStates.SUCCESS);

                            navigateBack(
                                context,
                                Learn_Home_Screen(
                                  title: title,
                                  subtitle: subtitle,
                                  numberImage: numberImage,
                                ));
                          }
                        }
                      },
                      child: Text("Share"),
                    ),
                  ],
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
