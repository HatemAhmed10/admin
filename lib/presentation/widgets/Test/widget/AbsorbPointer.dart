import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_Cubit.dart';
import '../../../../business_logic/Types/4Choose_Subject/Choose_Sub_State.dart';
import '../../../../data/models/1Type/4Choose-Subject/SubjectModel.dart';
import '../../../../shared/components/1Tooles/3CustomFormField.dart';
import '../../3Types/4Choose_Subject/3ColorsListView.dart';

class Add1 extends StatefulWidget {
  const Add1({super.key});

  @override
  State<Add1> createState() => _Add1State();
}

class _Add1State extends State<Add1> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Choose_Subj_Cubit(),
      child: BlocConsumer<Choose_Subj_Cubit, Choose_Subj_States>(
        listener: (context, state) {
          // if (state is AddSubjectFailure) {}

          if (state is AddSubjectSuccess) {
            BlocProvider.of<Choose_Subj_Cubit>(context).fetchAllSubjects();
            // Navigator.pop(context);
          }
        },
        builder: (context, state) {
          Choose_Subj_Cubit cubit = Choose_Subj_Cubit.get(context);
          final GlobalKey<FormState> formKey = GlobalKey();
          TextEditingController text = TextEditingController();
          TextEditingController dec = TextEditingController();
          AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                      const ColorsListView(),
                      const SizedBox(
                        height: 32,
                      ),
                      MaterialButton(
                        onPressed: () {
                          var subjectModel = SubjectModel(
                              title: "dsad",
                              subTitle: "dad",
                              color: Colors.blue.value);
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
        },
      ),
    );
  }
}
