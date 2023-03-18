import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_Cubit.dart';
import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_State.dart';
import '../../../../shared/components/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key,
      required this.isActive,
      required this.color,
      required this.index});

  final bool isActive;

  final Color color;
  final int index;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: Image(
              image: KImage[index],
            ),
          )
        : CircleAvatar(
            backgroundColor: Colors.green,
            radius: 38,
            child: Image(
              image: KImage[index],
            ),
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // bool isActive = false;

    return BlocProvider(
      create: (context) => Choose_Subj_Cubit(),
      child: BlocBuilder<Choose_Subj_Cubit, Choose_Subj_States>(
        builder: (context, state) {
          return SizedBox(
            height: 38 * 2,
            child: ListView.builder(
              itemCount: KImage.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      // isActive = currentIndex == index;

                      // isActive = currentIndex == index;
                      // BlocProvider.of<Choose_Subj_Cubit>(context).color =
                      //     KImage[index];
                      // setState(() {});
                    },
                    child: ColorItem(
                      color: Colors.red,
                      isActive: currentIndex == index,
                      index: currentIndex,
                    ),
                    // child: Container(
                    //   decoration: isActive == true
                    //       ? BoxDecoration(color: Colors.red)
                    //       : BoxDecoration(color: Colors.green),
                    //   child: Image(
                    //     image: KImage[index],
                    //   ),
                    // ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}



//  SizedBox(
//                                     height: 38 * 2,
//                                     child: ListView.builder(
//                                       itemCount: KImage.length,
//                                       scrollDirection: Axis.horizontal,
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 6),
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               cubit.changeactive(index);
//                                               print(cubit.currentIndex);
//                                               print(index);

//                                               // currentIndex = index;
//                                               // isActive = currentIndex == index;

//                                               // isActive = currentIndex == index;
//                                               // BlocProvider.of<Choose_Subj_Cubit>(context).color =
//                                               //     KImage[index];
//                                               // setState(() {});
//                                             },
//                                             // child: ColorItem(
//                                             //   color: Colors.red,
//                                             //   isActive: currentIndex == index,
//                                             //   index: currentIndex,
//                                             // ),
//                                             child: Container(
//                                               decoration:
//                                                   index == cubit.currentIndex
//                                                       ? BoxDecoration(
//                                                           color: Colors.red)
//                                                       : BoxDecoration(
//                                                           color: Colors.green),
//                                               child: Image(
//                                                 image: KImage[index],
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
                                  
                                  