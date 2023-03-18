// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:vertical_card_pager/vertical_card_pager.dart';

// import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_Cubit.dart';
// import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_State.dart';
// import '../../../../data/models/1Type/4Choose-Subject/SubjectModel.dart';

// class SubjectList extends StatefulWidget {
//   const SubjectList({Key? key, required this.subject}) : super(key: key);

//   final List<SubjectModel>? subject;

//   @override
//   State<SubjectList> createState() => _SubjectListState();
// }

// class _SubjectListState extends State<SubjectList> {
//   // @override
//   // void initState() {
//   //   BlocProvider.of<Choose_Subj_Cubit>(context).fetchAllSubjects();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // List<SubjectModel> notes =
//     //     BlocProvider.of<Choose_Subj_Cubit>(context).subject!;

//     return BlocProvider(
//       create: (context) => Choose_Subj_Cubit(),
//       child: BlocBuilder<Choose_Subj_Cubit, Choose_Subj_States>(
//         builder: (context, state) {
//           Choose_Subj_Cubit cubit = Choose_Subj_Cubit.get(context);

//           return Scaffold(
//             appBar: AppBar(
//               title: Text(cubit.subject!.length.toString()),
//             ),
//             body: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: Column(
//                   children: <Widget>[
//                     Expanded(
//                         child: VerticalCardPager(
//                       images: [
//                         for (int x = 0; x < widget.subject!.length; x++)
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(40),
//                             child: Container(
//                               color: Color(widget.subject![x].color),
//                             ),
//                           ),
//                       ],
//                       titles: [
//                         for (int x = 0; x < widget.subject!.length; x++)
//                           widget.subject![x].title
//                       ],
//                       onPageChanged: (page) {},
//                       onSelectedItem: (index) {
//                         print(index);
//                       },
//                     )),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
