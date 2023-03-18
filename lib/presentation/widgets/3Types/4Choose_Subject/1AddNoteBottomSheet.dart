// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_Cubit.dart';
// import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_State.dart';
// import '2AddNoteForm.dart';

// class AddNoteBottomSheet extends StatelessWidget {
//   const AddNoteBottomSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => Choose_Subj_Cubit(),
//       child: BlocConsumer<Choose_Subj_Cubit, Choose_Subj_States>(
//         listener: (context, state) {
//           if (state is AddSubjectFailure) {}

//           if (state is AddSubjectSuccess) {
//             BlocProvider.of<Choose_Subj_Cubit>(context).fetchAllSubjects();
//             Navigator.pop(context);
//           }
//         },
//         builder: (context, state) {
//           return AbsorbPointer(
//             absorbing: state is AddSubjectLoading ? true : false,
//             child: Padding(
//               padding: EdgeInsets.only(
//                   left: 16,
//                   right: 16,
//                   bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: const SingleChildScrollView(
//                 child: AddNoteForm(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
