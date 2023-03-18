// import 'package:admin/data/models/1Type/4Choose-Subject/SubjectModel.dart';
// import 'package:admin/shared/components/1Tooles/3CustomFormField.dart';
// import 'package:admin/shared/components/1Tooles/4CustomshowToast.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_Cubit.dart';
// import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_State.dart';
// import '../../../../shared/components/1Tooles/1CustomButton.dart';
// import '3ColorsListView.dart';

// class AddNoteForm extends StatefulWidget {
//   const AddNoteForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<AddNoteForm> createState() => _AddNoteFormState();
// }

// class _AddNoteFormState extends State<AddNoteForm> {
//   final GlobalKey<FormState> formKey = GlobalKey();
//   TextEditingController text = TextEditingController();
//   TextEditingController dec = TextEditingController();

//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   String? title, subTitle;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       autovalidateMode: autovalidateMode,
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 32,
//           ),
//           CustomFormField(
//               Validator: () {},
//               type: TextInputType.text,
//               controller: text,
//               hintText: "title",
//               validatorMassage: "Please Enter Message"),
//           const SizedBox(
//             height: 16,
//           ),
//           CustomFormField(
//               Validator: () {},
//               type: TextInputType.text,
//               controller: dec,
//               hintText: "content",
//               validatorMassage: "Please Enter Content"),
//           const SizedBox(
//             height: 32,
//           ),
//           const ColorsListView(),
//           const SizedBox(
//             height: 32,
//           ),
//           BlocBuilder<Choose_Subj_Cubit, Choose_Subj_States>(
//             builder: (context, state) {
//               return CustomButton(
//                 widget: Text("Add"),
//                 function: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();

//                     var subjectModel = SubjectModel(
//                         title: text.text,
//                         subTitle: dec.text,
//                         color: Colors.blue.value);
//                     BlocProvider.of<Choose_Subj_Cubit>(context)
//                         .addSubject(subjectModel);

//                     BlocProvider.of<Choose_Subj_Cubit>(context)
//                         .fetchAllSubjects();

//                     showToast(text: "SUCCESS Add", state: ToastStates.SUCCESS);
//                   } else {
//                     autovalidateMode = AutovalidateMode.always;
//                     setState(() {});
//                   }
//                 },

//                 // isLoading: state is AddNoteLoading ? true : false,
//                 // onTap: () {},
//               );
//             },
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//         ],
//       ),
//     );
//   }
// }
