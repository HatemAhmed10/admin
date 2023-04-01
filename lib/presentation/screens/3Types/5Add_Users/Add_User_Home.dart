import 'package:admin/shared/components/CustomButton.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../business_logic/Types/5Add_Users/Add_Users_Cubit.dart';
import '../../../../business_logic/Types/5Add_Users/Add_Users_State.dart';
import '../../../../shared/components/1Tooles/1CustomButton.dart';
import '../../../../shared/components/1Tooles/4CustomshowToast.dart';
import '../../../../shared/components/1Tooles/5Custom_Navigate.dart';
import 'Show_Users_Home.dart';

class AddUserTasksScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Add_Users_Cubit(),
      child: BlocConsumer<Add_Users_Cubit, Add_Users_States>(
        listener: (context, state) {
          if (state is SocialCreateUserSuccessState) {
            print("Tommmmmmmmmmmmmmmmmmmmm");
            // CacheHelper.saveData(
            //   key: 'uId',
            //   value: state.uId,
            // ).then((value) {
            //   navigateAndFinish(
            //     context,
            //     Home_Screen(),
            //   );
            // });

            // // navigateAndFinish(
            // //   context,
            // //   Page1_Screen(),
            // // );
          }
        },
        builder: (context, state) {
          Add_Users_Cubit cubit = Add_Users_Cubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        Text(
                          'Register now to communicate with friends',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'User Name',
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            // suffixIcon: IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(
                            //     Icons.person,
                            //   ),
                            // ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock_outline,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                Add_Users_Cubit.get(context)
                                    .changePasswordVisibility();
                              },
                              icon: Icon(
                                Add_Users_Cubit.get(context).suffix,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          obscureText: Add_Users_Cubit.get(context).isPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your phone number';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialRegisterLoadingState,
                          builder: (context) => Center(
                            child: CustomButton(
                              ButtonHight: 40,
                              backgroundcolor: ColorManager.defaultColor,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  Add_Users_Cubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                                showToast(
                                    text: "تم اضافه الطالب",
                                    state: ToastStates.SUCCESS);
                                navigateBack(context, Show_Users_Screen());
                              },
                              widget: Text('register'),
                            ),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
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
