import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/1Type/5Add_Users/User.dart';
import 'Get_Users_State.dart';

class Get_Users_Cubit extends Cubit<Get_Users_States> {
  Get_Users_Cubit() : super(GetUsersInitialState());

  static Get_Users_Cubit get(context) => BlocProvider.of(context);

  List<SocialUserModel> users = [];
  var numberOfToken;

  fetchAllUsers() {
    emit(GetUsersLoadingSuccess());
    // users.clear();
    FirebaseFirestore.instance.collection('users').snapshots().listen((event) {
      users.clear();
      event.docs.forEach((element) {
        users.add(SocialUserModel.fromJson(element.data()));
      });

      emit(GetUsersSuccess());
    });

    // users = NewsList;
    // emit(GetUsersSuccess());
  }

  DeleteUsers({required String Id}) async {
    emit(DeleteLoadingSuccess());
    // users.clear();
    FirebaseFirestore.instance.collection('users').doc(Id).delete();
    final FirebaseAuth auth = FirebaseAuth.instance;

    // await FirebaseAuth.instance.signOut();
    await FirebaseAuth.instance.currentUser!.delete();
    emit(DeleteUsersSuccess());
  }
}
