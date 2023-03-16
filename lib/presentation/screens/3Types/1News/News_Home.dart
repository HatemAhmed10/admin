import 'package:admin/presentation/screens/2Choose_Type_Screen/Change_Type_Screen.dart';
import 'package:admin/shared/components/1Tooles/4CustomshowToast.dart';
import 'package:admin/shared/components/1Tooles/5Custom_Navigate.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/1News_type/News_Cubit.dart';
import '../../../../business_logic/Types/1News_type/News_State.dart';

// To upload Image To Firebase
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../shared/components/1Tooles/3CustomFormField.dart';
import '../../../../shared/styles/assets_manager.dart';

class News_Home_Screen extends StatefulWidget {
  const News_Home_Screen({super.key});

  @override
  State<News_Home_Screen> createState() => _News_Home_ScreenState();
}

class _News_Home_ScreenState extends State<News_Home_Screen> {
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
      create: (context) => News_Cubit(),
      child: BlocBuilder<News_Cubit, News_States>(
        builder: (context, state) {
          News_Cubit cubit = News_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              // title: Text("Add News"),
              title: Text(cubit.FinaUrl),
              actions: [
                TextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (cubit.photo == null) {
                        cubit.UploadNews(text: text.text, imageUrl: "");
                        navigateAndFinish(context, ChangeTypeScreen());
                      } else {
                        await cubit.uploadFile(text: text.text);
                        // cubit.UploadNews(
                        //     text: text.text, imageUrl: cubit.FinaUrl);
                        navigateAndFinish(context, ChangeTypeScreen());
                      }
                    }
                  },
                  child: Text(
                    "Share",
                    style: cubit.photo != null
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! UploadImageLoadingState,
              builder: (context) => SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          cubit.ShowPicker(context, text.text);
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
                    )
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
