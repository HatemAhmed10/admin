import 'package:admin/data/models/1Type/4Choose-Subject/SubjectModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../business_logic/Types/3Quiz_Type/Quiz_Cubit.dart';
import '../../../../business_logic/Types/3Quiz_Type/Quiz_State.dart';
import '../../../../shared/components/1Tooles/4CustomshowToast.dart';
import '../../../../shared/components/1Tooles/5Custom_Navigate.dart';
import '../../../../shared/styles/colors.dart';
import '../4Choose_Subject/Choose_Subject.dart';

class Quiz_Home_Screen extends StatelessWidget {
  const Quiz_Home_Screen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.numberImage});

  final String title;
  final String subtitle;
  final int numberImage;
  @override
  Widget build(BuildContext context) {
    TextEditingController QuizTiem = TextEditingController();
    TextEditingController Postdesc = TextEditingController();
    TextEditingController Postdate = TextEditingController();

    TextEditingController Question = TextEditingController();
    TextEditingController Answer1 = TextEditingController();
    TextEditingController Answer2 = TextEditingController();
    TextEditingController Answer3 = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    DateTime now = DateTime.now();
    var formatterDate = DateFormat('dd/MM/yy');
    String actualDate = formatterDate.format(now);
    Postdate.text = actualDate.toString();
    Timestamp nowDate = Timestamp.now();

    return BlocProvider(
      create: (context) => Quiz_Cubit(),
      child: BlocBuilder<Quiz_Cubit, Quiz_States>(
        builder: (context, state) {
          Quiz_Cubit cubit = Quiz_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller: QuizTiem,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Time ';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "الوقت",
                          prefixIcon: Icon(Icons.time_to_leave),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller: Postdesc,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Desc address';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "الوصف",
                          prefixIcon: Icon(Icons.title),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller: Postdate,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Date address';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "التاريخ",
                          prefixIcon: Icon(Icons.dataset),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller: Question,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Question 1';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "السؤال رقم ${cubit.Counter}",
                          prefixIcon: Icon(Icons.title),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: Answer1,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your Question 2';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "الاجابه رقم ${cubit.Counter}",
                                prefixIcon: Icon(Icons.title),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: Answer2,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your Question 3';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "الاجابه رقم ${cubit.Counter}",
                                prefixIcon: Icon(Icons.title),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: Answer3,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your Question 3';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "الاجابه رقم ${cubit.Counter}",
                                prefixIcon: Icon(Icons.title),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.yellow,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: cubit.FAnswer == "A"
                                    ? ColorManager.defaultColor
                                    : ColorManager.white,
                                child: RadioListTile(
                                    activeColor: Colors.white,
                                    selected: cubit.FAnswer == "A",
                                    isThreeLine: false,
                                    title: Text(
                                      "A",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    value: "A",
                                    groupValue: cubit.FAnswer,
                                    onChanged: (value) {
                                      cubit.ChoiseAnswer(value.toString());
                                    }),
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                color: cubit.FAnswer == "B"
                                    ? ColorManager.defaultColor
                                    : ColorManager.white,
                                child: RadioListTile(
                                    activeColor: Colors.white,
                                    selected: cubit.FAnswer == "B",
                                    isThreeLine: false,
                                    title: Text(
                                      "B",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    value: "B",
                                    groupValue: cubit.FAnswer,
                                    onChanged: (value) {
                                      cubit.ChoiseAnswer(value.toString());
                                    }),
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                color: cubit.FAnswer == "C"
                                    ? ColorManager.defaultColor
                                    : ColorManager.white,
                                child: RadioListTile(
                                    activeColor: Colors.white,
                                    selected: cubit.FAnswer == "C",
                                    isThreeLine: false,
                                    title: Text(
                                      "C",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    value: "C",
                                    groupValue: cubit.FAnswer,
                                    onChanged: (value) {
                                      cubit.ChoiseAnswer(value.toString());
                                    }),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                    color: ColorManager.defaultColor,
                                  ),
                                  child: MaterialButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.AddDateToList(
                                              question: Question.text,
                                              answer1: Answer1.text,
                                              answer2: Answer2.text,
                                              answer3: Answer3.text,
                                              correctAnswer:
                                                  cubit.FAnswer.toString());
                                          cubit.ChangeCounterQuestion();
                                          Question.clear();
                                          Answer1.clear();
                                          Answer2.clear();
                                          Answer3.clear();
                                        }
                                      },
                                      textColor: Colors.white,
                                      child: Text("اضافه السؤال ")),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                    color: ColorManager.defaultColor,
                                  ),
                                  child: MaterialButton(
                                      onPressed: () {
                                        cubit.DeleteFromList();
                                      },
                                      textColor: Colors.white,
                                      child: Icon(Icons.delete_sharp)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! AddPostLoadingState,
                          builder: (context) => Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                              color: ColorManager.defaultColor,
                            ),
                            child: MaterialButton(
                                onPressed: () {
                                  if (cubit.InputQuestion.length == 0) {
                                    showToast(
                                        text: "لا يوجد اسئله",
                                        state: ToastStates.WARNING);
                                  } else {
                                    cubit.AddPost(
                                      QuizTime: int.parse(QuizTiem.text),
                                      Title: title,
                                      decTitle: subtitle,
                                      numberImage: numberImage,
                                      Desc: Postdesc.text,
                                      Date: nowDate,
                                      subjectModel: SubjectModel(
                                          title: title,
                                          subTitle: subtitle,
                                          color: numberImage),
                                      FQuestion: cubit.InputQuestion,
                                      FAnswer: cubit.InputAnswer,
                                      FcorrectAnswer: cubit.InputCorrectAnswer,
                                    );

                                    showToast(
                                        text: "تم اضافه الامتحان",
                                        state: ToastStates.SUCCESS);

                                    navigateBack(
                                        context,
                                        Choose_Subject(
                                          Next: "Quiz",
                                        ));
                                  }
                                },
                                textColor: Colors.white,
                                child: Text("اضافه الاختبار ")),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        // color: ColorManager.defaultColor,
                        width: double.infinity,
                        height: 260,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: ColorManager.defaultColor,
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: null,
                                            radius: 10,
                                            child: MaterialButton(
                                                onPressed: () {},
                                                child: Text(
                                                    (index + 1).toString())),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "#  " +
                                                        cubit.InputQuestion[
                                                            index],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      "A) " +
                                                          cubit.InputAnswer[
                                                                  index][
                                                              "Q${index + 1}"]![0],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )),
                                                    Expanded(
                                                        child: Text(
                                                      "B) " +
                                                          cubit.InputAnswer[
                                                                  index][
                                                                  "Q${index + 1}"]![
                                                                  1]
                                                              .toString(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )),
                                                    Expanded(
                                                        child: Text(
                                                      "C) " +
                                                          cubit.InputAnswer[
                                                                  index][
                                                                  "Q${index + 1}"]![
                                                                  2]
                                                              .toString(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  cubit.InputCorrectAnswer[
                                                      index],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: cubit.InputQuestion.length,
                        ),
                      ),
                    ),
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
