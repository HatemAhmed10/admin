import 'package:admin/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_Cubit.dart';
import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_State.dart';
import '../../../../data/models/1Type/4Choose-Subject/SubjectModel.dart';
import '../../../../shared/components/1Tooles/3CustomFormField.dart';
import '../../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../../shared/components/constants.dart';
import '../../../widgets/3Types/4Choose_Subject/1AddNoteBottomSheet.dart';
import '../../../widgets/3Types/4Choose_Subject/3ColorsListView.dart';
import '../../../widgets/3Types/4Choose_Subject/4SubjectList.dart';
import '../2Learn/Learn_Home.dart';
import '../3Quiz/Quiz_Home.dart';

class Choose_Subject extends StatelessWidget {
  // const Choose_Subject({super.key});

  const Choose_Subject({
    super.key,
    required this.Next,
  });

  final String Next;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Choose_Subj_Cubit()..fetchAllSubjects(),
      child: BlocBuilder<Choose_Subj_Cubit, Choose_Subj_States>(
        builder: (context, state) {
          Choose_Subj_Cubit cubit = Choose_Subj_Cubit.get(context);
          final GlobalKey<FormState> formKey = GlobalKey();
          TextEditingController text = TextEditingController();
          TextEditingController dec = TextEditingController();

          AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    context: context,
                    builder: (context) {
                      return AbsorbPointer(
                        absorbing: state is AddSubjectLoading ? true : false,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Form(
                            key: formKey,
                            autovalidateMode: autovalidateMode,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  CustomFormField(
                                      Validator: () {},
                                      type: TextInputType.text,
                                      controller: text,
                                      hintText: "title",
                                      validatorMassage: "Please Enter Message"),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomFormField(
                                      Validator: () {},
                                      type: TextInputType.text,
                                      controller: dec,
                                      hintText: "content",
                                      validatorMassage: "Please Enter Content"),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  SizedBox(
                                    height: 38 * 2,
                                    child: ListView.builder(
                                      itemCount: KImage.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6),
                                          child: GestureDetector(
                                            onTap: () {
                                              cubit.changeactive(index);

                                              // currentIndex = index;
                                              // isActive = currentIndex == index;

                                              // isActive = currentIndex == index;
                                              // BlocProvider.of<Choose_Subj_Cubit>(context).color =
                                              //     KImage[index];
                                              // setState(() {});
                                            },
                                            // child: ColorItem(
                                            //   color: Colors.red,
                                            //   isActive: currentIndex == index,
                                            //   index: currentIndex,
                                            // ),
                                            child: Container(
                                              decoration:
                                                  index == cubit.currentIndex
                                                      ? BoxDecoration(
                                                          color: Colors.red)
                                                      : BoxDecoration(
                                                          color: Colors.white),
                                              child: Image(
                                                image: KImage[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      var subjectModel = SubjectModel(
                                          title: text.text,
                                          subTitle: dec.text,
                                          color: cubit.currentIndex);
                                      cubit.addSubject(subjectModel);
                                      cubit.fetchAllSubjects();
                                      Navigator.pop(context);
                                    },
                                    child: Text("Add"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              title: Text("Subject"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: VerticalCardPager(
                      textStyle: TextStyle(color: Colors.red),
                      images: [
                        for (int x = 0; x < cubit.subject.length; x++)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image(
                              image: KImage[cubit.subject[x].color],
                            ),
                          ),
                      ],
                      titles: [
                        for (int x = 0; x < cubit.subject.length; x++)
                          "${cubit.subject[x].title}"
                      ],
                      onPageChanged: (page) {},
                      onSelectedItem: (index) {
                        switch (Next) {
                          case "Learn":
                            navigateTo(
                                context,
                                Learn_Home_Screen(
                                  title: cubit.subject[index].title,
                                  numberImage: cubit.subject[index].color,
                                  subtitle: cubit.subject[index].subTitle,
                                ));
                            break;
                          case "Quiz":
                            navigateTo(
                                context,
                                Quiz_Home_Screen(
                                  title: cubit.subject[index].title,
                                  numberImage: cubit.subject[index].color,
                                  subtitle: cubit.subject[index].subTitle,
                                ));
                            break;
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
